#!/usr/bin/env node

/**
 * soundgood
 * a way to interact with sound good database
 *
 * @author Taqui <taqui@kth.se>
 */

const init = require('./utils/init');
const cli = require('./utils/cli');
const log = require('./utils/log');
const { Client } = require('pg');
const input = cli.input;
const flags = cli.flags;
const { clear, debug } = flags;

(async () => {
	init({ clear });
	input.includes(`help`) && cli.showHelp(0);
	console.log("Waiting for DB");

	const client = new Client({
		user: 'postgres',
		host: 'localhost',
		database: 'sound',
		password: '123456',
		port: 5432,
	})

	await client.connect();
	console.log("Connected to DB");
	console.log(input);
	console.log(flags);

	if (input.includes(`ir`) && input.length === 1){
		console.log(`Listing all Instruments avaliable for rent`);
		await client.query(`
		SELECT * FROM InstrumentForRent 
		INNER JOIN Instrument ON instrumentforrent.instrumentid = instrument.instrumentid`)
		.then(res => {

			console.table(res.rows);
		})

	}
	else if(input.includes(`ir`) && input[1]){
		console.log(`Listing Instruments for ${input[1]}`);	
		console.log(`Listing all Instruments avaliable for rent`);
		await client.query(`
		SELECT * FROM InstrumentForRent 
		INNER JOIN Instrument ON instrumentforrent.instrumentid = instrument.instrumentid
		WHERE instrument.name = $1`, [input[1]])
		.then(res => {
			console.table(res.rows);
		});
	}

	if (input.includes(`icr`) && input.length === 1){
		console.log(`Listing all Instruments currently being rented`);
		await client.query(`SELECT * FROM InstrumentCurrentlyRenting INNER JOIN Person ON person.personid = instrumentcurrentlyrenting.personid;`)
		.then(res => {
			//console.log(res)
			console.table(res.rows);
		});

	}
	else if(input.includes(`icr`) && input[1]){
		console.log(`Listing Instruments currently being rented by person ${input[1]}`);
		await client.query(`SELECT * FROM InstrumentCurrentlyRenting INNER JOIN Person ON person.personid = $1`,[input[1]])
		.then(res => {
			//console.log(res)
			console.table(res.rows);
		});	
	}

	//input[1] = person-id input[2] = studentid input[3] = instrumentrentid input[4] = instrumentid
	//5 2 2 1 
	//4 1 1 1
	if (input.includes(`ri`)&& input.length <= 2){
		console.log(`Rent a specific Instruments but you forgot to supply a person!`);
	}
	else if(input.includes(`ri`) && input[1] && input[2]){
		console.log(`trying to rent Instruments  ${input[3]} by person ${input[4]}`);
		try {
			await client.query('BEGIN')
			const resForQuantities = await client.query('SELECT Quantities FROM InstrumentForRent WHERE instrumentforrent.instrumentrentid = $1;', [input[3]]);
			console.log(resForQuantities)

			if(resForQuantities.rows[0].quantities <= 0){
				throw "Quantity is Zero for instrumentID: " + input[3]; 
			}
			
			const res = await client.query('SELECT COUNT(*) FROM InstrumentCurrentlyRenting WHERE instrumentcurrentlyrenting.personid = $1;', [input[1]]);
			console.log(res);
			
			if(res.rows[0].count >= 2){
				console.log("Person has already rented 2 times bruh");
				throw "Person Already Rented"
			}
			await client.query('UPDATE InstrumentForRent SET Quantities = Quantities - 1 WHERE instrumentforrent.instrumentrentid = $1;', [input[3]]);
			await client.query('INSERT INTO InstrumentCurrentlyRenting (PersonID, StudentID, InstrumentRentID, InstrumentID, DateRented, Terminated) VALUES ($1 ,$2 ,$3, $4, NOW(), false);', input.slice(1));
			await client.query('COMMIT')
		  } catch (e) {
			await client.query('ROLLBACK')
			console.error(e);
		  }

	}
	//auto commit turn off
	//transaction even when reading xd

	if (input.includes(`ticr`) && input.length <= 2){
		console.log(`Stop a rent! but you forgot a person or instrument`)
	}
	else if(input.includes(`ticr`) && input[1]){
		console.log(`instrument to terminate ${input[2]}`);
		try {
			await client.query('BEGIN')
			
			const r1 = await client.query('UPDATE InstrumentForRent SET Quantities = Quantities + 1 WHERE instrumentforrent.instrumentrentid = $1', [input[2]]);
			//console.log(r1);
			const r2 = await client.query('UPDATE InstrumentCurrentlyRenting AS i SET Terminated = true WHERE i.instrumentrentid = $2 AND i.personid = $1;', input.slice(1));
			//console.log(r2),
			await client.query('COMMIT')
		  } catch (e) {
			await client.query('ROLLBACK')
			console.log(e);
		  }

	}
	

	await client.end();
	console.log("Dont Recognize the Command try help to see the commands");
	debug && log(flags);
})();

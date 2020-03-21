Test := CommissionEmployee new.
Test setFirstName:'Rose'; setLastName:'Harvey';
	setMinSal: 300d; setSales: 15000d; setRate: 0.15.
Test getInfo.
Test getEarning printNl.

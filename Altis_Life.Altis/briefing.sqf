waitUntil {!isNull player && player == player};

if(player diarySubjectExists "controls") exitwith{};

player createDiarySubject ["controls","Controls"];

player createDiaryRecord ["controls",
	[
		"",
			"
			Y: Open Player Menu<br/>
			U: Lock and unlock vehicles and houses<br/>
			F: Cop Siren (if cop)<br/>
			T: Vehicle Trunk<br/>
			Left Shift + B: Surrender<br/>
			Left Shift + R: Restrain (Cop Only)<br/>
			Left Shift + G: Knock out / stun (Civ Only, used for robbing them)<br/>
			Left Windows: Main Interaction key which is used for interacting with vehicles/houses (repair, etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
			Left Windows + T: Used for picking up items/money and gathering<br/>
			Left Shift + L: Activates cop/medic siren lights (as a cop/medic)<br/>
			Left Shift + H: Holster's your pistol<br/>
			Left Ctrl + H: Revert holster action<br/>
			"
	]
];

if(player diarySubjectExists "prices") exitwith{};

player createDiarySubject ["prices","Prices"];

player createDiaryRecord ["prices",
	[
		"",
			"
			Oil processed: @@@VITEM_oil_processed_SELLPRICE@@@ $<br/>
			Copper refined: @@@VITEM_copper_refined_SELLPRICE@@@ $<br/>
			Iron refined: @@@VITEM_iron_refined_SELLPRICE@@@ $<br/>
			Salt refined: @@@VITEM_salt_refined_SELLPRICE@@@ $<br/>
			Glass: @@@VITEM_glass_SELLPRICE@@@ $<br/>
			Diamond (uncut): @@@VITEM_diamond_uncut_SELLPRICE@@@ $<br/>
			Diamond (cut): @@@VITEM_diamond_cut_SELLPRICE@@@ $<br/>
			Cement: @@@VITEM_cement_SELLPRICE@@@ $<br/>
			<br/>
			Heroin: @@@VITEM_heroin_processed_SELLPRICE@@@ $<br/>
			Marijuana: @@@VITEM_marijuana_SELLPRICE@@@ $<br/>
			Cocaine: @@@VITEM_cocaine_processed_SELLPRICE@@@ $<br/>
			"
	]
];

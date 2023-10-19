DROP TABLE IF EXISTS Player CASCADE;
DROP TABLE IF EXISTS Inventory CASCADE;
DROP TABLE IF EXISTS Item CASCADE;
DROP TABLE IF EXISTS Inventory_Item CASCADE;
DROP TABLE IF EXISTS Armor CASCADE;
DROP TABLE IF EXISTS Equipment CASCADE;
DROP TABLE IF EXISTS Weapons CASCADE;
DROP TABLE IF EXISTS Skill CASCADE;
DROP TABLE IF EXISTS Skill_Player CASCADE;
DROP TABLE IF EXISTS Floor CASCADE;
DROP TABLE IF EXISTS Boss CASCADE;
DROP TABLE IF EXISTS Mob CASCADE;
CREATE TABLE Inventory(
	inventoryId serial PRIMARY KEY,
	size INTEGER CHECK (size>=50 and size<=100)
);
CREATE TABLE Player(
	playerId serial PRIMARY KEY,
	nickname text,
	hitpoints INTEGER,
	experiance INTEGER,
	gender text,
	age INTEGER,
	money INTEGER,
	status text,
	inventoryId serial REFERENCES Inventory(inventoryId)
);
CREATE TABLE Item(
	itemId serial PRIMARY KEY,
	name text,
	description text,
	drop_method text,
	lvl int
);
CREATE TABLE Armor(
	armorId serial PRIMARY KEY,
	itemId serial REFERENCES Item(itemId),
	defence_value INTEGER
);
CREATE TABLE Equipment(
	equipmentId serial PRIMARY KEY,
	itemId serial REFERENCES Item(itemId),
	defence_value INTEGER
);
CREATE TABLE Weapons(
	weaponsId serial PRIMARY KEY,
	itemId serial REFERENCES Item(itemId),
	damage_value INTEGER
);
CREATE TABLE Inventory_Item(
	inventoryId serial REFERENCES Inventory(inventoryId),
	itemId serial REFERENCES Item(itemId)
);
CREATE TABLE Skill(
	skillId serial PRIMARY KEY,
	name text,
	type text,
	drop_method text,
	description text
);
CREATE TABLE Skill_Player(
	playerId serial REFERENCES Player(playerId),
	skillId serial REFERENCES Skill(skillId)
);
CREATE TABLE Floor(
	floorId serial PRIMARY KEY,
	name text,
	climate text,
	main_town text,
	status text,
	description text
);
CREATE TABLE Boss(
	bossId serial PRIMARY KEY,
	name text,
	hitpoints int,
	floor int REFERENCES Floor(floorId),
	spawn_point text,
	features text,
	drop_item serial REFERENCES Item(itemId),
	teleport_ability bool
);
CREATE TABLE Mob(
	mobId serial PRIMARY KEY,
	name text,
	hitpoints int,
	floor int REFERENCES Floor(floorId),
	spawn_point text,
	features text,
	drop_item serial REFERENCES Item(itemId),
);

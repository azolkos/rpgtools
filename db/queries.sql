pragma foreign_keys = 'on';

drop view weapon_cat_sort;
drop table npc_armor_roll;
drop table armor;
drop table npc_weapon_roll;
drop table weapons;
drop table weapon_subtypes;
drop table weapon_reliability;
drop table weapon_availability;
drop table weapon_concealability;
drop table weapon_types;
drop table wounds;
drop table career_skills;
drop table skills;
drop table task_difficulties;
drop table body_parts;
drop table body_types;
drop table stats;
drop table roles;
drop table levels;

create table levels (
    id text not null primary key,
    lvl number
);

insert into levels (id,lvl) values ('Weak',1);
insert into levels (id,lvl) values ('Average',2);
insert into levels (id,lvl) values ('Minor Supporting',3);
insert into levels (id,lvl) values ('Minor Hero',4);
insert into levels (id,lvl) values ('Major Supporting',5);
insert into levels (id,lvl) values ('Major Hero',6);

-- Roles
create table roles (
    id text not null primary key,
    info text
);
insert into roles (id,info) values ('Soldier',null); --- walczący, wyszkolony w używaniu broni, ...
insert into roles (id,info) values ('Thug',null); --- brawler, streetwise, legia, ...
insert into roles (id,info) values ('Rogue',null); --- sprytny, streetwise, forgery, ...
insert into roles (id,info) values ('Hackman',null); --- programming, hacking, electronic sec, ...
insert into roles (id,info) values ('Techie',null); --- spawacz, naprawiacz rzeczy, electronics, robol, zlota rączka, ...
insert into roles (id,info) values ('Medic',null); --- leczy, ogarnia, załatwia dragi, surgery, ...
insert into roles (id,info) values ('Corporate',null); --- finance & shit, persuasion, bluff, ...
insert into roles (id,info) values ('Artist',null); --- tworzy sztukę, widzi piękno w rzeczach, w których inni widzą gówno, ...
insert into roles (id,info) values ('Activist',null); --- charyzma, gadanie do ludzi, nauki społeczne, teaching, ...
insert into roles (id,info) values ('Scientist',null); --- jakieś dziedziny naukowe (ścisłe) do wyboru + umiejętności typu teaching, ...

-- Stats
create table stats (
    id text not null primary key,
    idx number,
    idy number,
    type text,
    multiplier number,
    info text
);
insert into stats (id,idx,idy,type,multiplier,info) values ('REF',1,null,'primary',null,'REFLEX is a combined index, covering not only your basic dexterity, but also how your level of physical coordination will affect feats of driving, piloting, fighting and athletics.');
insert into stats (id,idx,idy,type,multiplier,info) values ('MA',2,null,'primary',null,'MOVEMENT ALLOWANCE is an index of how fast character can run (important in combat situations). The higher your Movement Allowance (MA), the more distance you can cover in turn.');
insert into stats (id,idx,idy,type,multiplier,info) values ('BODY',3,null,'primary',null,'Strength, Endurance and Constitution are all based on the character''s BODY TYPE. BODY TYPE determines how much damage you can take in wounds, how much you can lift or carry. How far you can throw, how well you recover from shock, and how much additional damage you cause with physical attacks.');
insert into stats (id,idx,idy,type,multiplier,info) values ('INT',4,null,'primary',null,'INTELLIGENCE is a measure of your problem solving ability; figuring out problems, noticing things, abstract thinking.');
insert into stats (id,idx,idy,type,multiplier,info) values ('WIS',5,null,'primary',null,'WISDOM is a measure of your common sense and knowledge. It also describes how down to earth you are.');
insert into stats (id,idx,idy,type,multiplier,info) values ('COOL',6,null,'primary',null,'COOL measures how well the character stands up to stress, pressure, physical pain and/or torture. In determining your willingness to fight on despite wounds or your fighting ability under fire, COOL is essential. It is also the measure of how "together" your character is and how tough he appears to others.');
insert into stats (id,idx,idy,type,multiplier,info) values ('TECH',7,null,'primary',null,'TECHNICAL ABILITY is an index of how well you relate to hardware and other technically oriented things.');
insert into stats (id,idx,idy,type,multiplier,info) values ('CHAR',8,null,'primary',null,'CHARISMA describes your overall ability in social interactions. It includes how attractive you are, your emotional intelligence and your communication skills.');
insert into stats (id,idx,idy,type,multiplier,info) values ('LUCK',9,null,'primary',null,'LUCK is the intangible "something" that throws the balance of events into your favor. Your luck represents how many points you may use each game to influence the outcome of critical event. To use Luck, you may add any or all the points of luck a character has to a critical die roll (declaring your inetntion to use Luck before the roll is made) until all of your Luck stat is used up. Luck is always restored at the end of each game session.');
insert into stats (id,idx,idy,type,multiplier,info) values ('REP',10,null,'secondary',null,'REPUTATION describes the chance of being identified by strangers.');

insert into stats (id,idx,idy,type,multiplier,info) values ('RUN',1,1,'MA',3,'To determine how far your character can run in a single combat round (@3.2 seconds) in meters, multiply your MA by 3. The character can run three times this distance in full 10 seconds turn.');
insert into stats (id,idx,idy,type,multiplier,info) values ('LEAP',2,1,'MA',0.75,'To determine how far your character can leap (from running start), divide your RUN by 4.');
insert into stats (id,idx,idy,type,multiplier,info) values ('CARRY',1,2,'BODY',10,'You may carry up to 10x Body Type in kg.');
insert into stats (id,idx,idy,type,multiplier,info) values ('LIFT',2,2,'BODY',40,'You may dead lift 40 times your Body Type in kg.');
insert into stats (id,idx,idy,type,multiplier,info) values ('DMG',1,3,null,3,'Compute damage bonus from BODY for use in melee weapons.');
insert into stats (id,idx,idy,type,multiplier,info) values ('SAVE',2,3,'BODY',1,'Your character''s Save Number is a value equal to your Body Type. To make saves, you must roll a value on 1D10 equal or lower than this number.');
insert into stats (id,idx,idy,type,multiplier,info) values ('BTM',3,3,'BODY',null,'Not all people take damage the same way. For example, it takes a lot more damage to stop Arnold The Terminator than it does Arnold The Nerd. This is reflected by the Body Type Modifier, a special bonus used by your character to reduce the effects of damage. The Body type modifier is subtracted from any damage your character takes in combat.');

-- Body types
create table body_types (
    id text not null primary key,
    pts_from number not null,
    pts_to number,
    bt_modifier number,
    dmg_modifier number
);
insert into body_types (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Very Weak',1,2,0,-2);
insert into body_types (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Weak',3,4,-1,-1);
insert into body_types (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Average',5,7,-2,0);
insert into body_types (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Strong',8,9,-3,1);
insert into body_types (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Very Strong',10,10,-4,2);
insert into body_types (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Superhuman',11,null,-5,4);

-- Body parts
create table body_parts (
    id text not null primary key,
    idx number,
    d_from number,
    d_to number
);

insert into body_parts (id,idx,d_from,d_to) values ('Head',1,1,1);
insert into body_parts (id,idx,d_from,d_to) values ('Torso',2,2,4);
insert into body_parts (id,idx,d_from,d_to) values ('L.Arm',3,5,5);
insert into body_parts (id,idx,d_from,d_to) values ('R.Arm',4,6,6);
insert into body_parts (id,idx,d_from,d_to) values ('L.Leg',5,7,8);
insert into body_parts (id,idx,d_from,d_to) values ('R.Leg',6,9,0);

-- Task difficulties
create table task_difficulties (
    id text not null primary key,
    from_pts number not null,
    to_pts
);
insert into task_difficulties (id,from_pts,to_pts) values ('Easy',10,14);
insert into task_difficulties (id,from_pts,to_pts) values ('Average',15,19);
insert into task_difficulties (id,from_pts,to_pts) values ('Diffucult',20,24);
insert into task_difficulties (id,from_pts,to_pts) values ('Very Difficult',25,29);
insert into task_difficulties (id,from_pts,to_pts) values ('Nearly Impossible',30,null);

-- Skills
create table skills (
    id text not null primary key,
    stat_id text,
    info text,
    foreign key(stat_id) references stats(id)
);
insert into skills (id,stat_id,info) values ('Personal Grooming','CHAR','This is the skill of knowing proper grooming, hair styling, etc., to maximize your physical attractiveness. Use of this skill allows players to increase their Attractiveness, and thus their chances of successful Relationships or Persuasion. A basically good looking person would be at +2. A fashion model might have a Personal Grooming of +5 or +6. At +8 or better, you could be major fashion model, film star, or trendsetter. You are always "together". And know it.');
insert into skills (id,stat_id,info) values ('Wardrobe & Style','CHAR','The skill of knowing the right clothes to wear, when to wear them, and how to look cool even in a spacesuit. With Wardrobe +2 or better, you are good at choosing clothes off the rack. At +6, your friends ask you for wardrobe tips, and you never buy anything off the rack. At +8 or better, you are one of those rare people whose personal style influences major fashion trends.');
insert into skills (id,stat_id,info) values ('Interview','CHAR',null);
insert into skills (id,stat_id,info) values ('Leadership','CHAR',null);
insert into skills (id,stat_id,info) values ('Seduction','CHAR',null);
insert into skills (id,stat_id,info) values ('Bluff','CHAR',null);
insert into skills (id,stat_id,info) values ('Social','CHAR',null);
insert into skills (id,stat_id,info) values ('Persuasion & Fast Talk','CHAR',null);
insert into skills (id,stat_id,info) values ('Human Perception','CHAR',null);
insert into skills (id,stat_id,info) values ('Perform','CHAR',null);

insert into skills (id,stat_id,info) values ('Endurance','BODY',null);
insert into skills (id,stat_id,info) values ('Strength Feat','BODY',null);
insert into skills (id,stat_id,info) values ('Swimming','BODY',null);
insert into skills (id,stat_id,info) values ('Climbing','BODY',null);
insert into skills (id,stat_id,info) values ('Throwing','BODY',null);

insert into skills (id,stat_id,info) values ('Intimidate','COOL',null);
insert into skills (id,stat_id,info) values ('Oratory','COOL',null);
insert into skills (id,stat_id,info) values ('Resist Torture/Drugs','COOL',null);
insert into skills (id,stat_id,info) values ('Streetwise','COOL',null);

insert into skills (id,stat_id,info) values ('Chemistry','INT',null);
insert into skills (id,stat_id,info) values ('Composition','INT',null);
insert into skills (id,stat_id,info) values ('Gamble','INT',null);
insert into skills (id,stat_id,info) values ('Database Search','INT',null);
insert into skills (id,stat_id,info) values ('Mathematics','INT',null);
insert into skills (id,stat_id,info) values ('Physics','INT',null);
insert into skills (id,stat_id,info) values ('Programming','INT',null);
insert into skills (id,stat_id,info) values ('Shadow/Track','INT',null);
insert into skills (id,stat_id,info) values ('Economics','INT',null);
insert into skills (id,stat_id,info) values ('Finance','INT',null);
insert into skills (id,stat_id,info) values ('System Knowledge','INT',null);
insert into skills (id,stat_id,info) values ('Teaching','INT',null);
insert into skills (id,stat_id,info) values ('Wilderness survival','INT',null);
insert into skills (id,stat_id,info) values ('Analytics','INT',null);
insert into skills (id,stat_id,info) values ('Psychology','INT',null);
insert into skills (id,stat_id,info) values ('Sociology','INT',null);

insert into skills (id,stat_id,info) values ('Political Science','WIS',null);
insert into skills (id,stat_id,info) values ('Geology','WIS',null);
insert into skills (id,stat_id,info) values ('Anthropology','WIS',null);
insert into skills (id,stat_id,info) values ('Biology','WIS',null);
insert into skills (id,stat_id,info) values ('Diagnosis','WIS',null);
insert into skills (id,stat_id,info) values ('First Aid','WIS',null);
insert into skills (id,stat_id,info) values ('Natural Medicine','WIS',null);
insert into skills (id,stat_id,info) values ('Pharmaceuticals','WIS',null);
insert into skills (id,stat_id,info) values ('Surgery','WIS',null);
insert into skills (id,stat_id,info) values ('History','WIS',null);
insert into skills (id,stat_id,info) values ('Hide/Evade','WIS',null);
insert into skills (id,stat_id,info) values ('General Knowledge','WIS',null);
insert into skills (id,stat_id,info) values ('Awareness/Notice','WIS',null);

insert into skills (id,stat_id,info) values ('Archery','REF',null);
insert into skills (id,stat_id,info) values ('Athletics','REF',null);
insert into skills (id,stat_id,info) values ('Brawling','REF',null);
insert into skills (id,stat_id,info) values ('Dance','REF',null);
insert into skills (id,stat_id,info) values ('Dodge & Escape','REF',null);
insert into skills (id,stat_id,info) values ('Driving','REF',null);
insert into skills (id,stat_id,info) values ('Fencing','REF',null);
insert into skills (id,stat_id,info) values ('Handgun','REF',null);
insert into skills (id,stat_id,info) values ('Heavy Weapons','REF',null);
insert into skills (id,stat_id,info) values ('Boxing','REF',null);
insert into skills (id,stat_id,info) values ('Wrestling','REF',null);
insert into skills (id,stat_id,info) values ('Judo','REF',null);
insert into skills (id,stat_id,info) values ('Aikido','REF',null);
insert into skills (id,stat_id,info) values ('Karate','REF',null);
insert into skills (id,stat_id,info) values ('Tea Kwon Do','REF',null);
insert into skills (id,stat_id,info) values ('Melee','REF',null);
insert into skills (id,stat_id,info) values ('Operate Heavy Machinery','REF',null);
insert into skills (id,stat_id,info) values ('Pilot','REF',null);
insert into skills (id,stat_id,info) values ('Rifle','REF',null);
insert into skills (id,stat_id,info) values ('Stealth','REF',null);
insert into skills (id,stat_id,info) values ('Submachinegun','REF',null);
insert into skills (id,stat_id,info) values ('Pick Pocket','REF',null);

insert into skills (id,stat_id,info) values ('Basic Tech','TECH',null);
insert into skills (id,stat_id,info) values ('Engineering','TECH',null);
insert into skills (id,stat_id,info) values ('Demolitions','TECH',null);
insert into skills (id,stat_id,info) values ('Disguise','TECH',null);
insert into skills (id,stat_id,info) values ('Electronics','TECH',null);
insert into skills (id,stat_id,info) values ('Electronic Security','TECH',null);
insert into skills (id,stat_id,info) values ('Forgery','TECH',null);
insert into skills (id,stat_id,info) values ('Film & Draw','TECH',null);
insert into skills (id,stat_id,info) values ('Pick Lock','TECH',null);
insert into skills (id,stat_id,info) values ('Play Instrument','TECH',null);
insert into skills (id,stat_id,info) values ('Weaponsmith','TECH',null);

-- Career Skills
create table career_skills (
    role_id text,
    skill_id text,
    alt number,
    alt_no number,
    foreign key(role_id) references roles(id),
    foreign key(skill_id) references skills(id)
);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Handgun',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Submachinegun',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Rifle',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Melee',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Stealth',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Boxing',1,1);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Wrestling',1,1);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Judo',1,1);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Aikido',1,1);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Karate',1,1);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Tea Kwon Do',1,1);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Pilot',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Awareness/Notice',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Soldier','Athletics',null,null);

insert into career_skills (role_id,skill_id,alt,alt_no) values ('Thug','Brawling',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Thug','Endurance',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Thug','Strength Feat',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Thug','Melee',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Thug','Driving',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Thug','Streetwise',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Thug','Intimidate',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Thug','Resist Torture/Drugs',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Thug','Handgun',null,null);

insert into career_skills (role_id,skill_id,alt,alt_no) values ('Rogue','Pick Lock',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Rogue','Stealth',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Rogue','Pick Pocket',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Rogue','Hide/Evade',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Rogue','Dodge & Escape',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Rogue','Awareness/Notice',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Rogue','Shadow/Track',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Rogue','Bluff',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Rogue','Disguise',null,null);

insert into career_skills (role_id,skill_id,alt,alt_no) values ('Hackman','Programming',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Hackman','Electronic Security',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Hackman','Analytics',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Hackman','System Knowledge',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Hackman','Database Search',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Hackman','Electronics',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Hackman','Mathematics',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Hackman','Gamble',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Hackman','Forgery',null,null);

insert into career_skills (role_id,skill_id,alt,alt_no) values ('Techie','Physics',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Techie','Engineering',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Techie','Basic Tech',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Techie','Electronics',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Techie','Weaponsmith',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Techie','Demolitions',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Techie','Operate Heavy Machinery',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Techie','Chemistry',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Techie','Pilot',null,null);

insert into career_skills (role_id,skill_id,alt,alt_no) values ('Medic','Natural Medicine',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Medic','Pharmaceuticals',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Medic','First Aid',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Medic','Diagnosis',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Medic','Surgery',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Medic','Biology',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Medic','Anthropology',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Medic','Chemistry',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Medic','Interview',null,null);

insert into career_skills (role_id,skill_id,alt,alt_no) values ('Corporate','Finance',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Corporate','General Knowledge',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Corporate','Analytics',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Corporate','Social',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Corporate','Leadership',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Corporate','Human Perception',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Corporate','Bluff',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Corporate','Interview',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Corporate','Wardrobe & Style',null,null);

insert into career_skills (role_id,skill_id,alt,alt_no) values ('Artist','Film & Draw',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Artist','Oratory',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Artist','Play Instrument',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Artist','Dance',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Artist','Composition',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Artist','Persuasion & Fast Talk',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Artist','Perform',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Artist','Seduction',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Artist','Personal Grooming',null,null);

insert into career_skills (role_id,skill_id,alt,alt_no) values ('Activist','Sociology',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Activist','Political Science',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Activist','Oratory',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Activist','Persuasion & Fast Talk',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Activist','Psychology',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Activist','Teaching',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Activist','Social',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Activist','General Knowledge',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Activist','Leadership',null,null);

insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Database Search',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Interview',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Analytics',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','General Knowledge',null,null);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Mathematics',1,5);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Physics',1,5);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Chemistry',1,5);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Biology',1,5);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Anthropology',1,5);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Economics',1,5);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','History',1,5);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Geology',1,5);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Psychology',1,5);
insert into career_skills (role_id,skill_id,alt,alt_no) values ('Scientist','Sociology',1,5);

create table wounds (
    id not null primary key,
    abr text,
    stun_save_mod number
);
insert into wounds (id,abr,stun_save_mod) values ('Light', 'Lite', 0);
insert into wounds (id,abr,stun_save_mod) values ('Serious', 'Srs', -1);
insert into wounds (id,abr,stun_save_mod) values ('Critical', 'Crt', -2);
insert into wounds (id,abr,stun_save_mod) values ('Mortal 0', 'Mrt0', -3);
insert into wounds (id,abr,stun_save_mod) values ('Mortal 1', 'Mrt1', -4);
insert into wounds (id,abr,stun_save_mod) values ('Mortal 2', 'Mrt2', -5);
insert into wounds (id,abr,stun_save_mod) values ('Mortal 3', 'Mrt3', -6);
insert into wounds (id,abr,stun_save_mod) values ('Mortal 4', 'Mrt4', -7);
insert into wounds (id,abr,stun_save_mod) values ('Mortal 5', 'Mrt5', -8);
insert into wounds (id,abr,stun_save_mod) values ('Mortal 6', 'Mrt6', -9);

create table weapon_types (
  id text not null primary key,
  name text
);

insert into weapon_types (id, name) values ('P','Pistol');
insert into weapon_types (id, name) values ('SMG','Submachinegun');
insert into weapon_types (id, name) values ('SHG','Shotgun');
insert into weapon_types (id, name) values ('RIF','Rifle');
insert into weapon_types (id, name) values ('HVY','Heavy Weapon');
insert into weapon_types (id, name) values ('MEL','Melee Weapon');
insert into weapon_types (id, name) values ('EX','Exotic Weapon');

create table weapon_concealability (
    id text not null primary key,
    name text
);

insert into weapon_concealability (id, name) values ('P','Pocket, Pants Leg or Sleeve');
insert into weapon_concealability (id, name) values ('J','Jacket, Coat or Shoulder Rig');
insert into weapon_concealability (id, name) values ('L','Long Coat');
insert into weapon_concealability (id, name) values ('N','Can''t be hidden');

create table weapon_availability (
    id text not null primary key,
    name text,
    info text
);

insert into weapon_availability (id,name,info) values ('E','Excellent','Can by found almost anywhere');
insert into weapon_availability (id,name,info) values ('C','Common','Can by found in most sports & gun stores or on the Street');
insert into weapon_availability (id,name,info) values ('P','Poor','Specialty weapons, black market, stolen military');
insert into weapon_availability (id,name,info) values ('R','Rare','Stolen, one of a kind, special military issue, may by highly illegal');

create table weapon_reliability (
    id text not null primary key,
    name text
);

insert into weapon_reliability (id, name) values ('VR','Very Reliable');
insert into weapon_reliability (id, name) values ('ST','Standard');
insert into weapon_reliability (id, name) values ('UR','Unreliable');

create table weapon_subtypes (
    id text not null primary key,
    name text
);

insert into weapon_subtypes (id, name) values ('L','Light');
insert into weapon_subtypes (id, name) values ('M','Medium');
insert into weapon_subtypes (id, name) values ('H','Heavy');
insert into weapon_subtypes (id, name) values ('VH','Very Heavy');

create table weapons (
    name text not null primary key,
    type text,
    subtype text,
    accuracy number,
    concealability text,
    availability text,
    damage text,
    ammo text,
    shots number,
    rof number,
    reliability text,
    range text,
    cost number,
    info text,
    foreign key(type) references weapon_types(id),
    foreign key(subtype) references weapon_subtypes(id),
    foreign key(concealability) references weapon_concealability(id),
    foreign key(availability) references weapon_availability(id),
    foreign key(reliability) references weapon_reliability(id)
);

insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('BudgetArms C-13','P','L',-1,'P','E','1D6','5mm',8,2,'ST','50m',75,'Light duty autopistol used as a holding and "lady''s gun".');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Dai Lung Cybermag 15','P','L',-1,'P','C','1D6+1','6mm',10,2,'UR','50m',50,'Cheap Hong Kong knockoff, often used boosters and other street trash.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Federated Arms X-22','P','L',0,'P','E','1D6+1','6mm',10,2,'ST','50m',150,'The ubiquitous "Polymer-one-shot" cheap plastic pistol. Available in different colors.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Militech Arms Avenger','P','M',0,'J','E','2D6+1','9mm',10,2,'VR','50m',250,'Well-made autopistol with good range and accuracy. A professional''s gun.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Dai Lung Streetmaster','P','M',0,'J','E','2D6+3','10mm',12,2,'UR','50m',250,'Another Dai Lung cheapie, built for the street.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Federated Arms X-9mm','P','M',0,'J','E','2D6+1','9mm',12,2,'ST','50m',300,'Saturday Solo''s gun, used as a standard military sidearm in the U.S. and E.C.C.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('BudgetArms Auto 3','P','H',-1,'J','E','3D6','11mm',8,2,'UR','50m',350,'It''s cheap, It''s powerful, It blows up sometimes. What else do you want?');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Sternmeyer Type 35','P','H',0,'J','C','3D6','11mm',8,2,'VR','50m',400,'Rugged, reliable, with excellent stop-ping power. Another fine E.C.C. prod-uct from the United Germanies.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Armalite 44','P','VH',0,'J','E','4D6+1','12mm',8,1,'ST','50m',450,'Designed as an alternate to the 1998 U.S. Army sidearm trials. A solid con-tender.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Colt AMT Model 2000','P','VH',0,'J','C','4D6+1','12mm',8,1,'VR','50m',500,'Now the standard officer''s sidearm for the U.S. Army, the M-2000 served well in the Central American Wars.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Uzi Miniauto 9','SMG','L',1,'J','E','2D6+1','9mm',30,35,'VR','150m',475,'Uzi''s entry into the 21st century, all plastic, with a rotary electric clip and adjustable trigger. The choice for many security Solos.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('H&K MP-2013','SMG','L',1,'J','C','2D6+3','10mm',35,32,'ST','150m',450,'Heckler&Koch''s updating of the MP-5K classic, with compound plastics and built in silencing.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Fed. Arms Tech Assault II','SMG','L',1,'J','C','1D6+1','6mm',50,25,'ST','150m',400,'An updated version of the venerable Tech Assault I, features larger clip, bet-ter autofire, no melting. Honest.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Arasaka Minami 10','SMG','M',0,'J','E','2D6+3','10mm',40,20,'VR','200m',500,'The standard Arasaka Security weapon, found worldwide. A good, all round weapon.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('H&K MPK-9','SMG','M',1,'J','C','2D6+1','9mm',35,25,'ST','200m',520,'A light composite submachinegun with integral sights. Used by many Euro Solos.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Sternmeyer SMG 21','SMG','H',-1,'L','E','3D6','11mm',30,15,'VR','200m',500,'Sternmeyer''s best entry in the anti-terrorist category, with wide use on C-SWAT teams and PsychoSquads');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('H&K MPK-11','SMG','H',0,'L','C','4D6+1','12mm',30,20,'ST','200m',700,'Possibly the most used Solo''s gun in existence, the MPK-11 can be modified into four different designs, including a bullpup configuration, standard SMG, an assault carbine, and a grenade launcher mount.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Ingram MAC 14','SMG','H',-2,'L','E','4D6+1','12mm',20,10,'ST','200m',650,'Updated MAC-10, with composite body and cylindrical feeding magazine.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Militech Ronin Light Assault','RIF','L',1,'N','C','5D6','5.56',35,30,'VR','400m',450,'A light, all purpose update, similar to the M-16B.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('AKR-20 Medium Assault','RIF','M',0,'N','C','5D6','5.56',30,30,'ST','400m',500,'A plastic and carbon fiber update of the AKM, distributed throughout the re-mains of the Soviet Bloc.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('FN -RAL Heavy Assault Rifle','RIF','H',-1,'N','C','6D6+2','7.62',30,30,'VR','400m',600,'The standard NATO assault weapon for battlefield work. Bullpup design, collapsing stock.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Kalishnikov A-80 Hvy. Rifle','RIF','H',-1,'N','E','6D6+2','7.62',35,25,'ST','400m',550,'Another Soviet retread, with improved sighting and lightened with composites');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Arasaka Rapid Assault 12','SHG',null,-1,'N','C','4D6','00',20,10,'ST','50m',900,'A high powered auto-shotgun with lethal firepower. Used by Arasaka worldwide. Another good reason to avoid the Boys in Black.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Sternmeyer Stakeout 10','SHG',null,-2,'N','R','4D6','00',10,2,'ST','50m',450,'Light duty stakeout shotgun, used by city police departments.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Barrett-Arasaka Light 20mm','HVY',null,0,'N','R','4D10', 'AP 20/9mm',10,1,'VR','450m',2000,'The cyberpsycho hunter''s favorite. Almost 2 meters long, this "cannon" fires a depleted uranium shell at super-sonic speeds. Heavy AP sub-caliber penetrator damages armor 2 pts/hit.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Scorpion 16 Missile Launcher','HVY',null,-1,'N','R','7D10',null,1,1,'VR','1km',3000,'The third generation of the Stinger missile launcher, this shoulder arm fires one missile.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Militech Arms RPG-A','HVY',null,-2,'N','R','6D10',null,1,1,'VR','750m',1500,'Shoulder-mounted, rocket-powered grenade launcher. Heavily used in the Central American conflicts under the name RPG-A.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Frag Grenade','HVY',null,0,'P','P','7D6',null,1,1,'VR','Throw',30,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Incendiary Grenade','HVY',null,0,'P','P','4D6 (3t)',null,1,1,'VR','Throw',30,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Stun Grenade','HVY',null,0,'P','P','-5 Stun',null,1,1,'VR','Throw',30,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Dazzle Grenade','HVY',null,0,'P','P','Blind (4t)',null,1,1,'VR','Throw',30,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Sonic Grenade','HVY',null,0,'P','P','Deafened (4t)',null,1,1,'VR','Throw',30,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Nausea Grenade','HVY',null,0,'P','P','-4 REF',null,1,1,'VR','Throw',30,'Illness');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Teargas Grenade','HVY',null,0,'P','P','-2 REF',null,1,1,'VR','Throw',30,'Tearing');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Sleepgas Grenade','HVY',null,0,'P','P','Sleep',null,1,1,'VR','Throw',30,'Half effect is drowsiness, -2 to all stats');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Biotoxin I Grenade','HVY',null,0,'P','P','4D6',null,1,1,'VR','Throw',30,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Biotoxin II Grenade','HVY',null,0,'P','P','8D6',null,1,1,'VR','Throw',30,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Nerve Gas Grenade','HVY',null,0,'P','P','8D10',null,1,1,'VR','Throw',30,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Grenade Launcher','HVY',null,0,'N','R',null,'Grenade',1,1,'ST','225m',150,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('C-6 Plastic Explosive','HVY',null,0,'P','P','8D10',null,1,1,'VR',null,100,'Grey block of plastique, can be deto-nated by timer, tripwire or signal.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Mine','HVY',null,0,'J','P','4D10',null,1,1,'VR',null,350,'Can be detonated by timer, tripwire, signal or motion detector.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('K-A F-253 Flamethrower','HVY',null,-2,'N','R','2D10+1',null,0,1,'ST','50m',1500,'Liquefied napalm sprayer. Back mounted and bulky. Does extra damage following initial hit.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Avante P-1135 Needlegun','P',null,0,'P','P',null,'Drugs',15,2,'ST','40m',200,'Lightweight, plastic, compressed air powered. Can be doped with drugs, poison.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Enertex AKM Power Squirt','P',null,-2,'J','C',null,'Drugs',50,1,'VR','10m',15,'A squirtgun. Yes, a powered squirtgun.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Nelspot "Wombat"','P',null,-1,'J','C',null,'Drugs',20,2,'UR','40m',200,'Paintball gun from hell. Can fire acid, paint, drugs, poison');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Miltech Electronics Taser','P',null,-1,'J','C','Stun',null,10,1,'ST','10m',60,'Zap. About the size of a small hand flashlight.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('EagleTech "Tomcat" C-Bow','EX',null,0,'N','C','4D6',null,12,1,'VR','150m',150,'Gyrobalanced, stabilized compound bow. Silent & deadly.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('EagleTech "Stryker" X-bow','EX',null,-1,'N','C','3D6+3',null,12,1,'VR','50m',220,'Plastic and bimetal crossbow. Silent, deadly, and you usually get your ammo back.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Kendachi Monoknife','MEL',null,1,'P','P','2D6',null,null,null,'VR','1m',200,'Mono-sectional crystal blade. Incredibly sharp. In the Japanese "tanto" style.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Kendachi MonoKatana','MEL',null,1,'N','R','4D6',null,null,null,'VR','1m',600,'Sword length version of monoblade. Resembles a hightech katana with a milky, nearly transparent blade.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('SPM-1 Battleglove','MEL',null,-2,'N','P','3D6/2D6',null,null,null,'VR','1m',900,'This is a large gauntlet covering the hand and forearm. It does 3D6 in crush damage, 2D6 punch damage, and has three spaces which can be used to store any standard cyberarm option.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Club','MEL',null,0,'L','C','1D6',null,null,null,null,'1m',0,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Knife','MEL','L',0,'P','C','1D6',null,null,null,null,'1m',20,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Sword','MEL',null,0,'N','C','2D6+2',null,null,null,null,'1m',200,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Axe','MEL',null,-1,'N','C','2D6+3',null,null,null,null,'1m',20,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Nunchaku/Tonfa','MEL',null,0,'L','C','3D6',null,null,null,null,'1m',15,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Naginata','MEL',null,0,'N','P','3D6',null,null,null,null,'2m',100,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Shiriken','MEL',null,0,'P','C','1D6/3',null,null,null,null,'Throw',3,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Switchblade','MEL',null,0,'P','C','1D6/2',null,null,null,null,'1m',15,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Brass knuckles','MEL',null,0,'P','C','1D6+2',null,null,null,null,'1m',10,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Sledgehammer','MEL',null,-1,'N','C','4D6',null,null,null,null,'1m',20,null);
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Chainsaw','MEL',null,-3,'N','C','4D6',null,null,null,null,'2m',80,null);

insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('S&W Combat Magnum','P',null,1,'J','C','2D6+3','.357',6,2,'VR','50m',null,'Designed for US Border Patrol use. the Combat Magnum is a popular choice among police officers. Its "small frame" and reliable action make it a best seller.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Liama Commanche','P',null,0,'J','C','4D6','.44',6,1,'ST','50m',null,'An excellent .44 revolver, used in home defense and police work. It''s long barrel makes it hard to conceal.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Colt .45 "Peacemaker"','P',null,0,'J','R','2D6+2','.45',6,1,'VR','50m',null,'The gun "that won the West", the .45 was the most common US sidearm throughout the 1800''s. A single action weapon, it must be cocked before firing, although later models had a flattened hammer allowing the gun to be fired by "fanning" the hammer.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Colt .38 Detective','P',null,1,'J','C','1D6+2','.38',6,1,'VR','50m',null,'The most commonplace police weapon for many years, the Colt .38 has many variants, including the smaller "Chief''s Special". With their high reliability, there are many of these guns still in circulation.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('C.O.P. .357 Derringer','P',null,0,'P','C','2D6+3','.357',4,2,'VR','50m',null,'Designed as a "holdout" for law enforcement agents, the COP uses a unique revolving firing pin arrangement. It''s small size makes it easily hidden.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('UZI','SMG',null,2,'J','C','2D6+1','9mm',30,20,'VR','150m',null,'Developed by the Israelis as a reliable export weapon, the Uzi is used worldwide by security forces, the US Secret Service, police and (unfortunately) terrorists and drug dealers.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Vz61 Skorpion','SMG',null,2,'J','P','1D6','.25',20,25,'VR','150m',null,'A standard military sidearm for the Soviet Bloc, the Skorpion is the worid''s smallest military SMG. It''s small ammunition size gives it excellent controllability. It is easily silenced and can be carried in a shoulder holster.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Ingram MAC 10','SMG',null,-1,'J','C','2D6+2','.45',30,5,'UR','150m',null,'A very small SMG used by covert units and terrorists. It can be easily silenced. However, it''s very large ammo size makes it very difficult to control when on full auto.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('H&K MP5','SMG',null,1,'L','C','2D6+1','9mm',30,20,'ST','150m',null,'Example of the H&K family of interchangeable SMGs.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Thompson M1','SMG',null,2,'N','C','2D6+2','.45',30,20,'VR','150m',null,'Standard US military SMG during WWII, the Thompson is rugged, reliable and easy to use. The M1928 version, of gangster fame, was less reliable (UR), but could carry a 5O round drum magazine.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Bushmaster','SMG',null,0,'J','R','4D6','5.56',30,20,'ST','150m',null,'A bullpup configured SMG designed to be fired one handed. The Bushmaster uses the M-16A1 clip, making it technically closer to an assault rifle than a submachinegun.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('FN-FAL','RIF',null,0,'N','E','6D6+2','7.56',20,21,'VR','400m',null,'Standard NATO rifle. A very deadly assault weapon, durable and handles well.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('AK-47','RIF',null,0,'N','E','5D6','7.565',30,20,'VR','400m',null,'Standard Soviet military rifle, exported worldwide, particularly to Soviet client-slates. Reliable, rugged, but rather difficult to control, the AK-47 is probably the most well known weapon of it''s type in the world.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('M-16A','RIF',null,2,'N','C','4D6','5.56',30,25,'UR','400m',null,'Standard US military rifle since the 1960''s, the M-16 has high accuracy and a staggering ROF. A built in "tumble" effect compensates for the light 5.56 round. Earlier M-16 models were cantankerous and unreliable in the extreme, with an accuracy of 1, not 2. The Ar-15 and the AR-180 are civilian models used by police and home defense.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Styer Aug','RIF',null,2,'N','C','4D6','5.56',30,20,'VR','400m',null,'A bullpup configured rifle using high tech plastics and aluminum, the AUG is the wave of the future. The scope is built in, giving it great accuracy, while it''s rugged plastic construction gives it reliability and strength.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('Winchester M70','RIF',null,3,'N','C','5D6+1','30-06',5,1,'VR','400m',null,'A basic scoped hunting rifle, used to hunt deer.');
insert into weapons (name,type,subtype,accuracy,concealability,availability,damage,ammo,shots,rof,reliability,range,cost, info) values ('CAWS','SHG',null,0,'N','R','4D6','00',10,10,'ST','50m',null,'Close in Assault Weapon, designed for house to house work, crowd suppression. Scope is built in. making it very accurate for type.');

create table npc_weapon_roll (
    pts_from number,
    pts_to number,
    weapon_type text,
    weapon_subtype text
);

insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (1,1,'MEL','L');
insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (2,2,'P','L');
insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (3,3,'P','M');
insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (4,5,'P','H');
insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (6,6,'SMG','L');
insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (7,7,'RIF','L');
insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (8,8,'RIF','M');
insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (9,null,'RIF','H');

create table armor (
    type text,
    material text,
    sp_head number,
    sp_torso number,
    sp_larm number,
    sp_rarm number,
    sp_lleg number,
    sp_rleg number,
    ev number,
    cost number
);


insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Vest','Leather',0,4,0,0,0,0,0,50);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Jacket','Leather',0,4,4,4,0,0,0,70);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Pants','Leather',0,0,0,0,4,4,0,30);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Vest','Light Kevlar',0,10,0,0,0,0,0,90);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Jacket','Light Kevlar',0,14,14,14,0,0,0,150);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Pants','Light Kevlar',0,0,0,0,10,10,0,70);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Helmet','Steel',14,0,0,0,0,0,0,20);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Vest','Flack',0,20,0,0,0,0,1,200);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Jacket','Medium Kevlar',0,18,18,18,0,0,1,200);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Pants','Flack',0,0,0,0,20,20,1,200);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Helmet','Nylon',20,0,0,0,0,0,0,100);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Jacket','Heavy Kevlar',0,20,20,20,0,0,2,250);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Vest','Gunner',0,25,0,0,0,0,3,250);
insert into armor (type,material,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Armor','MetalGear',25,25,25,25,25,25,2,600);

create table npc_armor_roll (
    pts_from number,
    pts_to number,
    material text
);

insert into npc_armor_roll (pts_from, pts_to, material) values (1,2,'Leather');
insert into npc_armor_roll (pts_from, pts_to, material) values (3,4,'Light Kevlar');
insert into npc_armor_roll (pts_from, pts_to, material) values (5,7,'Medium Kevlar');
insert into npc_armor_roll (pts_from, pts_to, material) values (8,9,'Heavy Kevlar');
insert into npc_armor_roll (pts_from, pts_to, material) values (10,null,'MetalGear');


create view weapon_cat_sort as
    select 'Light Pistols' cat, 1 idx union all
    select 'Medium Pistols' cat, 2 idx union all
    select 'Heavy Pistols' cat, 3 idx union all
    select 'Very Heavy Pistols' cat, 4 idx union all
    select 'Light Submachineguns' cat, 5 idx union all
    select 'Medium Submachineguns' cat, 6 idx union all
    select 'Heavy Submachineguns' cat, 7 idx union all
    select 'Shotguns' cat, 8 idx union all
    select 'Light Rifles' cat, 9 idx union all
    select 'Medium Rifles' cat, 10 idx union all
    select 'Heavy Rifles' cat, 11 idx union all
    select 'Heavy Weapons' cat, 12 idx union all
    select 'Light Melee Weapons' cat, 13 idx union all
    select 'Melee Weapons' cat, 14 idx union all
    select 'Exotic Weapons' cat, 15 idx union all
    select 'Pistols' cat, 16 idx union all
    select 'Submachineguns' cat, 17 idx union all
    select 'Rifles' cat, 18 idx
;

drop table wounds;
drop table career_skills;
drop table skills;
drop table task_difficulties;
drop table body_types;
drop table stats;
drop table roles;

create table roles (
    name text not null primary key
);
insert into roles (name) values ('Solo');
insert into roles (name) values ('Rocker');
insert into roles (name) values ('Netrunner');
insert into roles (name) values ('Media');
insert into roles (name) values ('Nomad');
insert into roles (name) values ('Fixer');
insert into roles (name) values ('Cop');
insert into roles (name) values ('Corp');
insert into roles (name) values ('Techie');
insert into roles (name) values ('Medtechie');

create table stats (
    stat text not null primary key,
    idx number,
    idy number,
    type text,
    multiplier number
);
insert into stats (stat,idx,idy,type,multiplier) values ('INT',1,null,'primary',null);
insert into stats (stat,idx,idy,type,multiplier) values ('REF',2,null,'primary',null);
insert into stats (stat,idx,idy,type,multiplier) values ('TECH',3,null,'primary',null);
insert into stats (stat,idx,idy,type,multiplier) values ('COOL',4,null,'primary',null);
insert into stats (stat,idx,idy,type,multiplier) values ('ATTR',5,null,'primary',null);
insert into stats (stat,idx,idy,type,multiplier) values ('LUCK',6,null,'primary',null);
insert into stats (stat,idx,idy,type,multiplier) values ('MA',7,null,'primary',null);
insert into stats (stat,idx,idy,type,multiplier) values ('BODY',8,null,'primary',null);
insert into stats (stat,idx,idy,type,multiplier) values ('EMP',9,null,'primary',null);
insert into stats (stat,idx,idy,type,multiplier) values ('RUN',1,1,'MA',3);
insert into stats (stat,idx,idy,type,multiplier) values ('REP',1,2,null,3);
insert into stats (stat,idx,idy,type,multiplier) values ('DMG',1,3,null,3);
insert into stats (stat,idx,idy,type,multiplier) values ('LEAP',2,1,'MA',0.75);
insert into stats (stat,idx,idy,type,multiplier) values ('SAVE',2,3,'BODY',1);
insert into stats (stat,idx,idy,type,multiplier) values ('LIFT',3,1,'BODY',40);
insert into stats (stat,idx,idy,type,multiplier) values ('HUMANITY',3,2,'EMP',10);
insert into stats (stat,idx,idy,type,multiplier) values ('BTM',3,3,'BODY',null);

-- Tu trzeba jakies inserty zrobić
create table npc_stats_roll (
    role_id text,
    stat_id text,
    lvl number,
    pts_from number,
    pts_to number
);

create table body_types (
    body_type text not null primary key,
    pts_from number not null,
    pts_to number,
    modifier number
);
insert into body_types (body_type, pts_from, pts_to, modifier) values ('Very Weak',1,2,0);
insert into body_types (body_type, pts_from, pts_to, modifier) values ('Weak',3,4,-1);
insert into body_types (body_type, pts_from, pts_to, modifier) values ('Average',5,7,-2);
insert into body_types (body_type, pts_from, pts_to, modifier) values ('Strong',8,9,-3);
insert into body_types (body_type, pts_from, pts_to, modifier) values ('Very Strong',10,10,-4);
insert into body_types (body_type, pts_from, pts_to, modifier) values ('Superhuman',11,null,-5);

create table body_parts (
    body_part text not null primary key,
    idx number,
    d_from number,
    d_to number
);

insert into body_parts (body_part, idx, d_from, d_to) values ('Head',1,1,1);
insert into body_parts (body_part, idx, d_from, d_to) values ('Torso',2,2,4);
insert into body_parts (body_part, idx, d_from, d_to) values ('L.Arm',3,5,5);
insert into body_parts (body_part, idx, d_from, d_to) values ('R.Arm',4,6,6);
insert into body_parts (body_part, idx, d_from, d_to) values ('L.Leg',5,7,8);
insert into body_parts (body_part, idx, d_from, d_to) values ('R.Leg',6,9,0);

create table task_difficulties (
    difficulty text not null primary key,
    from_pts number not null,
    to_pts
);
insert into task_difficulties (difficulty, from_pts, to_pts) values ('Easy',10,14);
insert into task_difficulties (difficulty, from_pts, to_pts) values ('Average',15,19);
insert into task_difficulties (difficulty, from_pts, to_pts) values ('Diffucult',20,24);
insert into task_difficulties (difficulty, from_pts, to_pts) values ('Very Difficult',25,29);
insert into task_difficulties (difficulty, from_pts, to_pts) values ('Nearly Impossible',30,null);

create table skills (
    skill text not null primary key,
    stat_id text,
    foreign key(stat_id) references stats(stat)
);
insert into skills (skill, stat_id) values ('Authority',null);
insert into skills (skill, stat_id) values ('Charismatic Leadership',null);
insert into skills (skill, stat_id) values ('Combat Sense',null);
insert into skills (skill, stat_id) values ('Credibility',null);
insert into skills (skill, stat_id) values ('Family',null);
insert into skills (skill, stat_id) values ('Interface',null);
insert into skills (skill, stat_id) values ('Jury Rig',null);
insert into skills (skill, stat_id) values ('Medical Tech',null);
insert into skills (skill, stat_id) values ('Resources',null);
insert into skills (skill, stat_id) values ('Streetdeal',null);
insert into skills (skill, stat_id) values ('Personal Grooming','ATTR');
insert into skills (skill, stat_id) values ('Wardrobe & Style','ATTR');
insert into skills (skill, stat_id) values ('Endurance','BODY');
insert into skills (skill, stat_id) values ('Strength Feat','BODY');
insert into skills (skill, stat_id) values ('Swimming','BODY');
insert into skills (skill, stat_id) values ('Interrogation','COOL');
insert into skills (skill, stat_id) values ('Intimidate','COOL');
insert into skills (skill, stat_id) values ('Oratory','COOL');
insert into skills (skill, stat_id) values ('Resist Torture/Drugs','COOL');
insert into skills (skill, stat_id) values ('Streetwise','COOL');
insert into skills (skill, stat_id) values ('Human Perception','EMP');
insert into skills (skill, stat_id) values ('Interview','EMP');
insert into skills (skill, stat_id) values ('Leadership','EMP');
insert into skills (skill, stat_id) values ('Seduction','EMP');
insert into skills (skill, stat_id) values ('Social','EMP');
insert into skills (skill, stat_id) values ('Persuasion & Fast Talk','EMP');
insert into skills (skill, stat_id) values ('Perform','EMP');
insert into skills (skill, stat_id) values ('Accounting','INT');
insert into skills (skill, stat_id) values ('Anthropology','INT');
insert into skills (skill, stat_id) values ('Awareness/Notice','INT');
insert into skills (skill, stat_id) values ('Biology','INT');
insert into skills (skill, stat_id) values ('Botany','INT');
insert into skills (skill, stat_id) values ('Chemistry','INT');
insert into skills (skill, stat_id) values ('Composition','INT');
insert into skills (skill, stat_id) values ('Diagnose Illness','INT');
insert into skills (skill, stat_id) values ('Education & General Knowledge','INT');
insert into skills (skill, stat_id) values ('Expert','INT');
insert into skills (skill, stat_id) values ('Gamble','INT');
insert into skills (skill, stat_id) values ('Geology','INT');
insert into skills (skill, stat_id) values ('Hide/Evade','INT');
insert into skills (skill, stat_id) values ('History','INT');
insert into skills (skill, stat_id) values ('Know Language (choose one)','INT');
insert into skills (skill, stat_id) values ('Library Search','INT');
insert into skills (skill, stat_id) values ('Mathematics','INT');
insert into skills (skill, stat_id) values ('Physics','INT');
insert into skills (skill, stat_id) values ('Programming','INT');
insert into skills (skill, stat_id) values ('Shadow/Track','INT');
insert into skills (skill, stat_id) values ('Stock Market','INT');
insert into skills (skill, stat_id) values ('System Knowledge','INT');
insert into skills (skill, stat_id) values ('Teaching','INT');
insert into skills (skill, stat_id) values ('Wilderness Survival','INT');
insert into skills (skill, stat_id) values ('Zoology','INT');
insert into skills (skill, stat_id) values ('Archery','REF');
insert into skills (skill, stat_id) values ('Athletics','REF');
insert into skills (skill, stat_id) values ('Brawling','REF');
insert into skills (skill, stat_id) values ('Dance','REF');
insert into skills (skill, stat_id) values ('Dodge & Escape','REF');
insert into skills (skill, stat_id) values ('Driving','REF');
insert into skills (skill, stat_id) values ('Fencing','REF');
insert into skills (skill, stat_id) values ('Handgun','REF');
insert into skills (skill, stat_id) values ('Heavy Weapons','REF');
insert into skills (skill, stat_id) values ('Martial Art (choose types)','REF');
insert into skills (skill, stat_id) values ('Melee','REF');
insert into skills (skill, stat_id) values ('Motorcycle','REF');
insert into skills (skill, stat_id) values ('Operate Heavy Machinery','REF');
insert into skills (skill, stat_id) values ('Pilot','REF');
insert into skills (skill, stat_id) values ('Pilot (Gyro)','REF');
insert into skills (skill, stat_id) values ('Pilot (Fixed Wing)','REF');
insert into skills (skill, stat_id) values ('Pilot (Dirigible)','REF');
insert into skills (skill, stat_id) values ('Pilot (Vect. Trust Vehicle)','REF');
insert into skills (skill, stat_id) values ('Rifle','REF');
insert into skills (skill, stat_id) values ('Stealth','REF');
insert into skills (skill, stat_id) values ('Submachinegun','REF');
insert into skills (skill, stat_id) values ('Aero Tech','TECH');
insert into skills (skill, stat_id) values ('AV Tech','TECH');
insert into skills (skill, stat_id) values ('Basic Tech','TECH');
insert into skills (skill, stat_id) values ('Cryotank Operation','TECH');
insert into skills (skill, stat_id) values ('Cyberdeck Design','TECH');
insert into skills (skill, stat_id) values ('CyberTech','TECH');
insert into skills (skill, stat_id) values ('Demolitions','TECH');
insert into skills (skill, stat_id) values ('Disguise','TECH');
insert into skills (skill, stat_id) values ('Electronics','TECH');
insert into skills (skill, stat_id) values ('Electronic Security','TECH');
insert into skills (skill, stat_id) values ('First Aid','TECH');
insert into skills (skill, stat_id) values ('Forgery','TECH');
insert into skills (skill, stat_id) values ('Gyro Tech','TECH');
insert into skills (skill, stat_id) values ('Paint or Draw','TECH');
insert into skills (skill, stat_id) values ('Photo & Film','TECH');
insert into skills (skill, stat_id) values ('Pharmaceuticals','TECH');
insert into skills (skill, stat_id) values ('Pick Lock','TECH');
insert into skills (skill, stat_id) values ('Pick Pocket','TECH');
insert into skills (skill, stat_id) values ('Play Instrument','TECH');
insert into skills (skill, stat_id) values ('Weaponsmith','TECH');

create table career_skills (
    role_id text,
    skill_id text,
    foreign key(role_id) references roles(name),
    foreign key(skill_id) references skills(skill)
);
insert into career_skills (role_id, skill_id) values ('Solo', 'Combat Sense');
insert into career_skills (role_id, skill_id) values ('Solo', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Solo', 'Handgun');
--insert into career_skills (role_id, skill_id) values ('Solo', 'Brawling or Martial Arts'); -- Nie ma
insert into career_skills (role_id, skill_id) values ('Solo', 'Melee');
--insert into career_skills (role_id, skill_id) values ('Solo', 'Weapons Tech'); -- Nie ma
insert into career_skills (role_id, skill_id) values ('Solo', 'Rifle');
insert into career_skills (role_id, skill_id) values ('Solo', 'Athletics');
insert into career_skills (role_id, skill_id) values ('Solo', 'Submachinegun');
insert into career_skills (role_id, skill_id) values ('Solo', 'Stealth');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Family');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Endurance');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Melee');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Rifle');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Driving');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Basic Tech');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Wilderness Survival');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Brawling');
insert into career_skills (role_id, skill_id) values ('Nomad', 'Athletics');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Charismatic Leadership');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Perform');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Wardrobe & Style');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Composition');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Brawling');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Play Instrument');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Streetwise');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Persuasion & Fast Talk');
insert into career_skills (role_id, skill_id) values ('Rocker', 'Seduction');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'Interface');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'Basic Tech');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'Education & General Knowledge');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'System Knowledge');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'CyberTech');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'Cyberdeck Design');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'Composition');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'Electronics');
insert into career_skills (role_id, skill_id) values ('Netrunner', 'Programming');
insert into career_skills (role_id, skill_id) values ('Corp', 'Resources');
insert into career_skills (role_id, skill_id) values ('Corp', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Corp', 'Human Perception');
insert into career_skills (role_id, skill_id) values ('Corp', 'Education & General Knowledge');
insert into career_skills (role_id, skill_id) values ('Corp', 'Library Search');
insert into career_skills (role_id, skill_id) values ('Corp', 'Social');
insert into career_skills (role_id, skill_id) values ('Corp', 'Persuasion & Fast Talk');
insert into career_skills (role_id, skill_id) values ('Corp', 'Stock Market');
insert into career_skills (role_id, skill_id) values ('Corp', 'Wardrobe & Style');
insert into career_skills (role_id, skill_id) values ('Corp', 'Personal Grooming');
insert into career_skills (role_id, skill_id) values ('Techie', 'Jury Rig');
insert into career_skills (role_id, skill_id) values ('Techie', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Techie', 'Basic Tech');
insert into career_skills (role_id, skill_id) values ('Techie', 'CyberTech');
insert into career_skills (role_id, skill_id) values ('Techie', 'Teaching');
insert into career_skills (role_id, skill_id) values ('Techie', 'Education & General Knowledge');
insert into career_skills (role_id, skill_id) values ('Techie', 'Electronics');
insert into career_skills (role_id, skill_id) values ('Techie', 'Gyro Tech');
insert into career_skills (role_id, skill_id) values ('Techie', 'Aero Tech');
insert into career_skills (role_id, skill_id) values ('Techie', 'Weaponsmith');
insert into career_skills (role_id, skill_id) values ('Techie', 'Electronic Security');
--insert into career_skills (role_id, skill_id) values ('Techie', 'Any three other'); -- Nie ma
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Medical Tech');
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Basic Tech');
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Diagnose Illness');
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Education & General Knowledge');
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Cryotank Operation');
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Library Search');
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Pharmaceuticals');
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Zoology');
insert into career_skills (role_id, skill_id) values ('Medtechie', 'Human Perception');
insert into career_skills (role_id, skill_id) values ('Media', 'Credibility');
insert into career_skills (role_id, skill_id) values ('Media', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Media', 'Composition');
insert into career_skills (role_id, skill_id) values ('Media', 'Education & General Knowledge');
insert into career_skills (role_id, skill_id) values ('Media', 'Persuasion & Fast Talk');
insert into career_skills (role_id, skill_id) values ('Media', 'Human Perception');
insert into career_skills (role_id, skill_id) values ('Media', 'Social');
insert into career_skills (role_id, skill_id) values ('Media', 'Streetwise');
insert into career_skills (role_id, skill_id) values ('Media', 'Photo & Film');
insert into career_skills (role_id, skill_id) values ('Media', 'Interview');
insert into career_skills (role_id, skill_id) values ('Cop', 'Authority');
insert into career_skills (role_id, skill_id) values ('Cop', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Cop', 'Handgun');
insert into career_skills (role_id, skill_id) values ('Cop', 'Human Perception');
insert into career_skills (role_id, skill_id) values ('Cop', 'Athletics');
insert into career_skills (role_id, skill_id) values ('Cop', 'Education & General Knowledge');
insert into career_skills (role_id, skill_id) values ('Cop', 'Brawling');
insert into career_skills (role_id, skill_id) values ('Cop', 'Melee');
insert into career_skills (role_id, skill_id) values ('Cop', 'Interrogation');
insert into career_skills (role_id, skill_id) values ('Cop', 'Streetwise');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Streetdeal');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Awareness/Notice');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Forgery');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Handgun');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Brawling');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Melee');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Pick Lock');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Pick Pocket');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Intimidate');
insert into career_skills (role_id, skill_id) values ('Fixer', 'Persuasion & Fast Talk');


create table wounds (
    wound not null primary key,
    abr text,
    stun_save_mod number
);
insert into wounds (wound, abr, stun_save_mod) values ('Light', 'Lite', 0);
insert into wounds (wound, abr, stun_save_mod) values ('Serious', 'Srs', -1);
insert into wounds (wound, abr, stun_save_mod) values ('Critical', 'Crt', -2);
insert into wounds (wound, abr, stun_save_mod) values ('Mortal 0', 'Mrt', -3);
insert into wounds (wound, abr, stun_save_mod) values ('Mortal 1', 'Mrt', -4);
insert into wounds (wound, abr, stun_save_mod) values ('Mortal 2', 'Mrt', -5);
insert into wounds (wound, abr, stun_save_mod) values ('Mortal 3', 'Mrt', -6);
insert into wounds (wound, abr, stun_save_mod) values ('Mortal 4', 'Mrt', -7);
insert into wounds (wound, abr, stun_save_mod) values ('Mortal 5', 'Mrt', -8);
insert into wounds (wound, abr, stun_save_mod) values ('Mortal 6', 'Mrt', -9);

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
    material text,
    foreign key(material) references armor(material)
);

insert into npc_armor_roll (pts_from, pts_to, material) values (1,2,'Leather');
insert into npc_armor_roll (pts_from, pts_to, material) values (3,4,'Light Kevlar');
insert into npc_armor_roll (pts_from, pts_to, material) values (5,7,'Medium Kevlar');
insert into npc_armor_roll (pts_from, pts_to, material) values (8,9,'Heavy Kevlar');
insert into npc_armor_roll (pts_from, pts_to, material) values (10,null,'MetalGear');


select * from main.sqlite_master where type = 'table';








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

create table body_types (
    body_type text not null,
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





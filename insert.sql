pragma foreign_keys = 'on';

-- Race
insert into tinfoilpunk_race (id,info) values ('Aryan','Pure bred Germanic people');
insert into tinfoilpunk_race (id,info) values ('Slavic','Eastern European descendants of the Great Lechia Empire');
insert into tinfoilpunk_race (id,info) values ('Caucasian','Standard white men');
insert into tinfoilpunk_race (id,info) values ('Asian','Oriental people from the far East');
insert into tinfoilpunk_race (id,info) values ('Arabic','People descended from the Middle East');
insert into tinfoilpunk_race (id,info) values ('African','Dark skinned people descending from the Pharaohs');

-- Levels
insert into tinfoilpunk_level (id,lvl) values ('Weak',1);
insert into tinfoilpunk_level (id,lvl) values ('Average',2);
insert into tinfoilpunk_level (id,lvl) values ('Minor Supporting',3);
insert into tinfoilpunk_level (id,lvl) values ('Minor Hero',4);
insert into tinfoilpunk_level (id,lvl) values ('Major Supporting',5);
insert into tinfoilpunk_level (id,lvl) values ('Major Hero',6);

-- Roles
insert into tinfoilpunk_role (id,info) values ('Soldier',null); --- walczący, wyszkolony w używaniu broni, ...
insert into tinfoilpunk_role (id,info) values ('Thug',null); --- brawler, streetwise, legia, ...
insert into tinfoilpunk_role (id,info) values ('Rogue',null); --- sprytny, streetwise, forgery, ...
insert into tinfoilpunk_role (id,info) values ('Hackman',null); --- programming, hacking, electronic sec, ...
insert into tinfoilpunk_role (id,info) values ('Techie',null); --- spawacz, naprawiacz rzeczy, electronics, robol, zlota rączka, ...
insert into tinfoilpunk_role (id,info) values ('Medic',null); --- leczy, ogarnia, załatwia dragi, surgery, ...
insert into tinfoilpunk_role (id,info) values ('Corporate',null); --- finance & shit, persuasion, bluff, ...
insert into tinfoilpunk_role (id,info) values ('Artist',null); --- tworzy sztukę, widzi piękno w rzeczach, w których inni widzą gówno, ...
insert into tinfoilpunk_role (id,info) values ('Activist',null); --- charyzma, gadanie do ludzi, nauki społeczne, teaching, ...
insert into tinfoilpunk_role (id,info) values ('Scientist',null); --- jakieś dziedziny naukowe (ścisłe) do wyboru + umiejętności typu teaching, ...

-- Stats
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('REF',1,null,'primary',null,'REFLEX is a combined index, covering not only your basic dexterity, but also how your level of physical coordination will affect feats of driving, piloting, fighting and athletics.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('MA',2,null,'primary',null,'MOVEMENT ALLOWANCE is an index of how fast character can run (important in combat situations). The higher your Movement Allowance (MA), the more distance you can cover in turn.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('BODY',3,null,'primary',null,'Strength, Endurance and Constitution are all based on the character''s BODY TYPE. BODY TYPE determines how much damage you can take in wounds, how much you can lift or carry. How far you can throw, how well you recover from shock, and how much additional damage you cause with physical attacks.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('INT',4,null,'primary',null,'INTELLIGENCE is a measure of your problem solving ability; figuring out problems, noticing things, abstract thinking.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('WIS',5,null,'primary',null,'WISDOM is a measure of your common sense and knowledge. It also describes how down to earth you are.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('COOL',6,null,'primary',null,'COOL measures how well the character stands up to stress, pressure, physical pain and/or torture. In determining your willingness to fight on despite wounds or your fighting ability under fire, COOL is essential. It is also the measure of how "together" your character is and how tough he appears to others.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('TECH',7,null,'primary',null,'TECHNICAL ABILITY is an index of how well you relate to hardware and other technically oriented things.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('CHAR',8,null,'primary',null,'CHARISMA describes your overall ability in social interactions. It includes how attractive you are, your emotional intelligence and your communication skills.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('LUCK',9,null,'primary',null,'LUCK is the intangible "something" that throws the balance of events into your favor. Your luck represents how many points you may use each game to influence the outcome of critical event. To use Luck, you may add any or all the points of luck a character has to a critical die roll (declaring your inetntion to use Luck before the roll is made) until all of your Luck stat is used up. Luck is always restored at the end of each game session.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('REP',10,null,'secondary',null,'REPUTATION describes the chance of being identified by strangers.');

insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('RUN',1,1,'MA',3,'To determine how far your character can run in a single combat round (@3.2 seconds) in meters, multiply your MA by 3. The character can run three times this distance in full 10 seconds turn.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('LEAP',2,1,'MA',0.75,'To determine how far your character can leap (from running start), divide your RUN by 4.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('CARRY',1,2,'BODY',10,'You may carry up to 10x Body Type in kg.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('LIFT',2,2,'BODY',40,'You may dead lift 40 times your Body Type in kg.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('DMG',1,3,null,3,'Compute damage bonus from BODY for use in melee weapons.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('SAVE',2,3,'BODY',1,'Your character''s Save Number is a value equal to your Body Type. To make saves, you must roll a value on 1D10 equal or lower than this number.');
insert into tinfoilpunk_stat (id,idx,idy,category,multiplier,info) values ('BTM',3,3,'BODY',null,'Not all people take damage the same way. For example, it takes a lot more damage to stop Arnold The Terminator than it does Arnold The Nerd. This is reflected by the Body Type Modifier, a special bonus used by your character to reduce the effects of damage. The Body type modifier is subtracted from any damage your character takes in combat.');

-- Race bonuses
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Asian','INT',2);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Asian','TECH',1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Asian','BODY',-2);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('African','BODY',2);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('African','INT',-1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('African','WIS',-2);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Arabic','MA',1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Arabic','WIS',1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Arabic','TECH',-1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Arabic','BODY',-1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Slavic','COOL',2);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Slavic','INT',1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Slavic','WIS',-3);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Slavic','CHAR',-2);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Slavic','BODY',-1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Slavic','REF',-1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Aryan','CHAR',2);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Aryan','WIS',1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Aryan','INT',1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Aryan','MA',-1);
insert into tinfoilpunk_racebonus (race_id,stat_id,modifier) values ('Aryan','REF',-1);

-- Body types
insert into tinfoilpunk_bodytype (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Frail',-5,0,0,1,-3);
insert into tinfoilpunk_bodytype (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Very Weak',1,2,0,-2);
insert into tinfoilpunk_bodytype (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Weak',3,4,-1,-1);
insert into tinfoilpunk_bodytype (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Average',5,7,-2,0);
insert into tinfoilpunk_bodytype (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Strong',8,9,-3,1);
insert into tinfoilpunk_bodytype (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Very Strong',10,10,-4,2);
insert into tinfoilpunk_bodytype (id,pts_from,pts_to,bt_modifier,dmg_modifier) values ('Superhuman',11,null,-5,4);

-- Body parts
insert into tinfoilpunk_bodypart (id,idx,d_from,d_to) values ('Head',1,1,1);
insert into tinfoilpunk_bodypart (id,idx,d_from,d_to) values ('Torso',2,2,4);
insert into tinfoilpunk_bodypart (id,idx,d_from,d_to) values ('L.Arm',3,5,5);
insert into tinfoilpunk_bodypart (id,idx,d_from,d_to) values ('R.Arm',4,6,6);
insert into tinfoilpunk_bodypart (id,idx,d_from,d_to) values ('L.Leg',5,7,8);
insert into tinfoilpunk_bodypart (id,idx,d_from,d_to) values ('R.Leg',6,9,0);

-- Skills
insert into tinfoilpunk_skill (id,stat_id,info) values ('Personal Grooming','CHAR','This is the skill of knowing proper grooming, hair styling, etc., to maximize your physical attractiveness. Use of this skill allows players to increase their Attractiveness, and thus their chances of successful Relationships or Persuasion. A basically good looking person would be at +2. A fashion model might have a Personal Grooming of +5 or +6. At +8 or better, you could be major fashion model, film star, or trendsetter. You are always "together". And know it.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Wardrobe & Style','CHAR','The skill of knowing the right clothes to wear, when to wear them, and how to look cool even in a spacesuit. With Wardrobe +2 or better, you are good at choosing clothes off the rack. At +6, your friends ask you for wardrobe tips, and you never buy anything off the rack. At +8 or better, you are one of those rare people whose personal style influences major fashion trends.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Interview','CHAR','The skill of eliciting interesting anecdotes from interview subject. This information will be of a more non-specific and personal nature rather than specific knowledge (distinguishing this skill from the skill Interrogation, where the user is trying to extract exact information. (Example: Barbara Walters interviews, Mike Wallace interrogates). At +3 or better, the subject will usually tell you only information relating to what he/she is well known for. At +6 or better, the subject will tell you anecdotes about the past, pontificate about favorite interests and philosophies, etc. At +9 or better, he/she tells you everything - including personal information about their illegitimate son, the time they stole a cookie at age +4, and the fact that no one ever loved them.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Leadership','CHAR','The skill of leading and convincing people to follow you. A leader with a skill +2 can manage a small office successfully and be respected for it. A leader with skill +4 or better can lead a small band of troops into battle and not get backshot. A leader with a skill of +7 or better can lead entire Gamelon Empire into battle and look good doing it. James Kirk of Star Trek has a Leadership of +11, but you never will.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Seduction','CHAR','The skill of forming and maintaining romantic relationships (this includes your abilities as a lover). This skill may be used to determine whether or not players can form relationships with other non-players characters and the intensity of these relationships. In certain cases, Referees may want to average this skill with a player''s Attractiveness to get a more realistic outcome.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Bluff','CHAR',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Social','CHAR','The ability to deal with social situations, like knowing the right fork to use or when not to tell the joke about farmer''s daughter and the travelling cyberware salesman. A Social skill of +2 or better will allow you to get by at any fine restaurant or social function. At +5, you can lunch with the President with aplomb. No social situation will faze you , no matter what. At +8 or above, you can lecture Emily Post on what''s proper.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Persuasion & Fast Talk','CHAR','The ability to talk others into doing what you want. This may be used individually or on large groups. At +3, you can win most debates or convince your girlfriend the blonde you were was your sister. At +5, you are a smooth talker of professional caliber. Ronald Reagan a Persuasion of +7. Hitler a Persuasion of +9.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Human Perception','CHAR','The skill of detecting any evasions, moods and other emotional clues from others. At +2, you can usually feel when you''re not getting the whole truth. At +6, you can detect subtle evasions and mood swings. At +8, you can not only detect subtle emotional clues, but can usually tell what the subject is hiding in a general way.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Perform','CHAR','The skill of trained acting, singing, etc. A trained performer of +4 or greater can successfully sing for payment at wedding or small clubs. Performers of +6 or greater will be considered to be of professional caliber, and may have lucrative contacts and fans. Performers of +9 or greater are of "star: caliber, have a large number of fans, and may be recognized on the street.');

insert into tinfoilpunk_skill (id,stat_id,info) values ('Endurance','BODY','This is the ability to withstand pain or hardship, particularly over long periods of time, by knowing the best ways to conserve strength and energy. Endurance Skill checks would be made whenever a character must continue to be active a long period without food, sleep or water.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Strength Feat','BODY','The user of this skill has practiced the art of bending bars, crushing objects, ripping phone books apart and other useful parlor tricks. At +3, no phonebook is safe, you can bend thin rebar, and snap handcuffs. At +10, you can bend prison bars, rip up the Gutenberg Bible, and dept car fenders with one blow.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Swimming','BODY','This skill is require to know how to swim.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Athletics','BODY','This skill is required for accurate throwing, climbing, and balancing. It combines the basic elements of any high school level sports program. At +3 and above, you are the equivalent of a real high school "jock". At +5 and above, you can perform in college level competitions. At +8 and above, you are of Olympic or Professional caliber.');

insert into tinfoilpunk_skill (id,stat_id,info) values ('Intimidate','COOL','The skill of getting people to do what you want by forcing personality or physical coercion. At +3, you can frighten almost any typical citizen, politician or low-level thug. At +6, you can intimidate Sylvester Stallone or any moderate "tough guy". At +9, you could intimidate Arnold Schwarzenegger.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Oratory','COOL','The skill of public speaking. At +2, you can wing high school contests. At +6, you can be paid speech in public. At +10, you are capable of delivering a speech to rival Kennedy''s "Ichn Bin Ein Berliner" or Lincoln''s Gettysburgs Address.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Resist Torture/Drugs','COOL','Characters with this skill are especially toughened against interrogation, torture and mind control drugs. A successful use of this skill will automatically increase the difficulty of any Interrogation attempt made by another guy by one level.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Streetwise','COOL','The knowledge of the "seamy" ways of life - where to get illegal and contraband things, how to talk to the criminal environment, and avoiding bad situations in bad neighborhoods. With Streetwise of +3 or better, you can get "hot" items, torture drugs, etc. A Streetwise of +5 would know you to arrange a murder contract, you know a few mobsters who might owe you, and be able to call on muscle when you need it. At +8 or better, you could become a major crimelord yourself and the middlemen.');

insert into tinfoilpunk_skill (id,stat_id,info) values ('Chemistry','INT','The required skill for mixing chemicals various compounds. A level +2 Chemistry is equal to high school chemistry. A level +4 is equal to a trained pharmacist or college level chemist. A +8 is a trained laboratory chemist.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Composition','INT','The required for writing songs, articles, or stories. A Composition Skill of +4 or greater gives your character the ability to produce salable work. A Skill of +8 or more produces work of such a high caliber that the creator may have a strong literary following and not a little critical acclaim.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Gamble','INT','The skill on knowing how to make bets, figure odds, and play games of chance successfully. As any professional gambler knows, this is not a luck skill. At +2, you are the local card shark at the Saturday night poker game. At +6, you can make a living at the tables in Vegas and Monte Carlo. At +9 or better, you can take on James Bond at roulette and stand a good chance of breaking the bank.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Database Search','INT','The skill of using databases, libraries and other compiled information sources to find facts. With a skill of +2 you can use most simple databases. With a skill of +6, you can easily access the Library Congress. At +9, you can comprehend almost any public databases and find very obscure facts.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Mathematics','INT','The skill of understanding calculations and mathematical formulas. At +3, you have ability to add, subtract, divide and multiply. At +4, you can do algebra and geometry. At +6, you can perform calculus. At +9, you can deduce your own mathematical formulas.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Physics','INT','The ability to calculate physical principles, such as gas pressures, mechanical energies, etc. This skill required basic Mathematics skill of +4.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Programming','INT','The required skill to write programs and re-program computer system. This skill does not allow players to actually do repairs on a computer (this requires Electronics). With a Programming Skill of +1, you can do simple EBASIC programs. A Programming Skill of +3 or better allows you to know some higher level languages and he able to write reasonably complex programs (including video games). Players with Programming Skill +6 or better are considered to be professionals, who can build operating software, design mainframe systems, and hold down a steady job at your average Silicon Valley firm. With a Programming Skill of +9 or better, other programmers speak your name with reverence ("You invented Q? Wow!"), young hackers set soft to crack your systems, and any computer software you design instantly gets used by every business application in wide world.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Shadow/Track','INT','The skill of shadowing hid following people. This skill is primary used in urban or inhabited areas rather than in wilderness (where the skill of Survival incorporates tracking game in the wilds).');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Economics','INT',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Finance','INT',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('System Knowledge','INT',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Teaching','INT','The skill of imparting knowledge to someone (if you don''t think this is skill, you ought to try it sometime). Players may not teach any skill unless they have a higher skill level than a student. The referee is the final arbiter of how long it takes to teach a skill. At a Teaching Skill of +3 or better, you can professionally teach students up to High School. At +6, you know enough to be a college professor (if you want). At +9 or greater, you are recognized by others in the field as good enough to guest lecture at MIT or Cal Tech; your texts on the subject are quoted as a major references, and you might have a TV show on the equivalent of PBS channel.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Wilderness survival','INT','The required skill for knowing how to survive in the wilds. Knowledge includes how to set traps, forage for wood, track game, build shelters, make fires. The average Boy Scout has a Survival of +3. A special Forces Green Beret has a Survival of +6 or above. Crizzly Adams, Mountain Man of the Wilderness, would have +9 or +10 Survival Skill.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Analytics','INT',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Psychology','INT',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Sociology','INT',null);

insert into tinfoilpunk_skill (id,stat_id,info) values ('Political Science','WIS',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Geology','WIS',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Anthropology','WIS','The knowledge of human cultures, habits and customs. Unlike Streetwise (which covers only the culture and customs of the Street), or Social (which covers only what you should do in a given situation), Anthropology covers general customs and background of a culture. For example, with Streetwise, you know what alleys to avoid and what gangs are dangerous. With Social, you know the proper forms of address for a high ranking Japanese zaibatsu head. With Anthropology, you know that the customs of a N''Tanga tribesman require that a young man kill a lion in order to be accepted as an adult male.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Biology','WIS','General knowledge of animals, plants, and other biological systems. At level +3, you know most types of common animals, plants. At +6, you have a general understanding of genetics, cellular biology, etc. At +10, you can perform most biolab procedures, including gene mapping and splicing.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Diagnosis','WIS','The skill of clinically diagnosing symptoms and medical problems. A +3 is the equivalent of a high school nurse - you can recognize most common injuries and complaints. At +6, you would be equivalent to a trained intern; you can recognize many uncommon illnesses and know how to treat most common ones. A +9 is equivalent to you to get a diagnosis.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('First Aid','WIS','This skill allows the user to bind wounds, stop bleeding, and revive a stunned patients (see Trauma Team for details).');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Natural Medicine','WIS',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Pharmaceuticals','WIS','The skill of designing and manufacturing drugs and medicines. A minimum Chemistry skill of +4 is required. At +4, you can make aspirin. At +6, you can make hallucinogenic or antibiotics. At level +9 you can build designer drugs tailored to individual body chemistries.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Surgery','WIS',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('History','WIS',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Hide/Evade','WIS','The skill of losing pursuers, covering tracks and otherwise evading people on your trail. At +3, you can lose most boostergangers on the rampage. At +6, you can ditch cops and private eys. At +8, you can ditch most Solos.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('General Knowledge','WIS','This skill is the equivalent of a basic public school education, allowing you to know how to read, write, use basic math, and know enough history to get by. In effect, it is a "lore" or trivaia skill. A level of +1 is a basic grade school education. A skill of +2 is equal to a high school equivalency. A Knowledge Skill of +3 is equal to a college education, +4 or higher is equal to a Masters or Doctorate. At +7, you are an extremely well-educated person, and are asked to play Trival Pursuit a lot. At +9 and above, you are one of those people who knows a lot about everything (and hopefully has the good sense to keep his mouth shut).');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Awareness/Notice','WIS','This is equivalent of a "trained observer" skill, allowing characters to notice or be aware of clues, shadowers and other events. With an Awareness of +2 you will usually spot small pieces of paper with noted on them, doors left ajar , and obvious expressions of lying or dislike. An Awareness of +5 or better allows you to spot fairly well hidden clues, and fairly sophisticated attempts to "shadow" you. With an Awareness of +8 or greater, you routinely perform the sorts of deductive reasoning seen in the average TV cop show ("The murder was left handed because this knife has a specialized handle"). Sherlock Holmes has a +10 Awareness. Players without skill may only use their Wisdom Stat.');

insert into tinfoilpunk_skill (id,stat_id,info) values ('Archery','REF','The skill required to use bows, crossbows and other arrow-based ranged weapons.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Brawling','REF','The skill of fighting man to man with fist, feet and other parts of the body. Brawling is not a trained skill - it is learned on the Street by getting into a lot of fights. Unlike Martial Arts, there are no specialized attacks and no damage bonuses based on level of mastery.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Dance','REF','The specific skill needed to become a professional dancer. A trained dancer +4 or greater can successfully dance for payment in small clubs or dance troupes. Dancers +6 or greater will be considered to professional caliber, and regularly give performances and have fans. Dancers +9 or greater are of "star" caliber, have a large number of fans, and may be recognized on the street.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Dodge & Escape','REF','This is skill is required to dodge attacks and escape grapples and holds. If an attack is made without your knowledge, you may not apply this skill to your Defense roll.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Driving','REF','This skill allows you to pilot all ground vehicles like cars, trucks, tanks and hovercraft. This skill is not usable for piloting aircraft. A skill +3 is equal to that of a very good non-professional driver. A skill of +6 allows you to drive with the skill of a moderately skilled race driver. An driver with skill of +8 or greater will be nationally ship races, and possibly have access to the most advanced ground vehicles available (as long as he makes an endorsement).');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Fencing','REF','The mastery of swords, rapiers and monoblades. A Fencing Skill of +3 allows you to be competent with a blade. A Skill of +5 makes you fairly skilled. A Fencing Skill of +6 might win you the National Fencing Competitions. A Skill of +8 will get you a reputation for being a true swordsman of duelist caliber. People like D''Artagnan or Miymoto Musashi have Skill of +10. They are legendary masters of the blade; the mention of whom will cause all but the stupidest young bravo to run for cover.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Handgun','REF','You must have this skill to effectively use handguns of any type, including cyberware types. At +2, you ca use a handgun on a target range, through combat will still rattle you. At +5, you are as skilled as most military officers of fancy shooting you see on TV, and have begun to get a reputation of being "good with gun". A +8, you are a recognized gunslinger with a "rep". The very sound of your name makes some people back down in fear. At +10, you are a legendary gunslinger, feared by all except the stupid young punks who keep trying to "take" you in innumerable gunfight challenges.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Heavy Weapons','REF','The required skill for using grenade launchers, autocannon, mortars, heavy machine guns, missiles and rocket launchers. A level +5 skill would be equivalent to a general military "Heavy Weapons" training course, giving the user the ability to use any or all of these weapon types.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Boxing','REF','The manly art of fisticuffs, this form delivers lightning punches and tight blocking defense. Key attacks are: punches, blocks & parries.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Wrestling','REF','This form combines techniques of Olympic and Professional wrestling. The style uses a wide variety of throws and holds to incapacitate the opponent. Key attacks include: throws, holds, escapes, chokes, sweeps, trips, and grapple.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Judo','REF','This system was designed as a sport form, but is very effective in combat as well. It uses throws and sweeps to knock down the opponent. Key attacks include dodges, throws, holds, escape sweeps & trips and grappling.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Aikido','REF','This form relies on using the opponent''s strength and momentum against him. It is a perfect form for stopping an opponent peacefully while making yourself very hard to hit. Key attacks are: blocks & parries, dodges, throws, holds, escapes, chokes, sweeps, trips & sweeps, grapples.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Karate','REF','The Japanese version of kung fu, this style uses straight line movements and powerful blows. Variations include shotokan and kenpo, each with their own special moves. Key attacks are: punches, kicks, and blocks & parries.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Tea Kwon Do','REF','A very fast and precise form, with graceful movements and some aerial kicks. Key attacks include: strikes, punches, kicks, blocks & parries, dodges.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Melee','REF','The ability to use knives, axes, clubs and other hand to hand weapons in combat.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Operate Heavy Machinery','REF','The required skill to operate tractors, tanks, very large trucks and construction equipment.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Pilot','REF','A Piloting Skill of +1 allows you to take off and land safely in good weather conditions. A Piloting Skill of +3 or more makes you a trained pilot, able to engage in most combat situation or bad weather. Pilots with a Skill of +6 or greater are veteran pilots, able to handle themselves in almost any situation, including aerobatic maneuvers. Pilots with a Skill of +9 or greater are so good, they have a rep as pilots, and are widely known among the piloting fraternity for having the "right stuff".');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Rifle','REF','You must have this skill to use riffle/shotguns effectively.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Stealth','REF','The skill of hiding in shadows, moving silently, evading guards, etc. A Stealth Skill of +1 is about the level of a very sneaky 10 year old stealing cookies. At +3, you are able to get past most guards, or your parents if you''ve been grounded. At +6, you are good enough to slip smoothly from shadow and not make any noise. At +8, you are the equal of most Ninja warriors. At +10, you move as silently as a shadow, making the Ninja sound like elephants.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Submachinegun','REF','You must have this skill to use any type of submachine gun effectively.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Pick Pocket','REF','The required skill for picking pockets without being noticed, as well as "shoplifting" small items.');

insert into tinfoilpunk_skill (id,stat_id,info) values ('Basic Tech','TECH','The required skill for building or repairing simple mechanical and electrical devices, such as car engines, television sets, etc. With a Basic Tech Skill of +3, or better, you can fix minor car problems, repair basic wiring, etc. A Basic Tech Skill of +6 or better can repair stereos and TVs, rebuild an engine, etc. A Basic Tech Skill of +9 or better can build a simple computer from scratch, put together a race car engine, and maintain any kind of industrial machinery. However, they do not know enough specialized knowledge to apply it to complex things such as aircraft (just like Mr. Goodwrench) doesn''t know how to build and service an F-16).');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Engineering','TECH',null);
insert into tinfoilpunk_skill (id,stat_id,info) values ('Demolitions','TECH','This skill allows the character to be knowledgeable in the use of explosives, as well as knowing the best explosives to use for which jobs, how to set times and detonators, and how much explosives to use to accomplish a desired result.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Disguise','TECH','The skill of disguising your character to resemble someone else, whether real or fictitious. This skill incorporates elements of both makeup and acting, although it is not the same as the ability to actually be an actor.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Electronics','TECH','The required skill for maintaining, repairing and modifying electronic instruments such as computers, personal electronics hardware, electronic security systems, cameras and monitors.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Electronic Security','TECH','The skill of installing or countering electronic eyes, electronic locks, bugs and tracers, security cameras, pressure plates, etc. At level +3, you can jimmy or install most apartment locks and security cams. At +6, you can override most corporate office locks and traps. At +9, you can enter most high security area with impunity.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Forgery','TECH','The skill of copying and creating false documents and identifications. This skill Forgery also be applied to the detection of same; if you can fake it, you can usually tell a fake as well.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Film & Draw','TECH','The skill of producing professional caliber photographs or motion pictures. A skill of +2 allows you to make decent home movies. A Skill +4 or better creates work capable of winning amateur contests. A Skill of +6 or better will produce work of the level of the average Playboy cover or rock video. A photographer or cinematographer with a Skill of +8 known and probably famous. The skill of producing professional drawings. A skill of +3 allows you to produce salable "modern" art. A Skill of +6will produce artwork that is recognized end extremely pleasant to eye - as well as salable. An artist with a Skill of +8 or greater will be nationally known, have exhibitions in galleries, and have other lesser artists studying his style in art.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Pick Lock','TECH','The skill required to pick locks and break into sealed containers and rooms. At +3, you can jimmy most simple locks. At +6 you can crack most safes. At +9 or better, you have a rep as master crackman, and are known to all the major players in the world.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Play Instrument','TECH','The skill of knowing how to play a musical instrument. You must take this skill separately for each type of instrument played. A skill of +4 or higher will qualify your character to play professional "gigs". A Skill of +8 and above will gain musician some professional acclaim, possibly with recording contracts and command performances. At +10, you are widely acclaimed, have lots of Grammys, and regularly jam with Kerry Eurodyne.');
insert into tinfoilpunk_skill (id,stat_id,info) values ('Weaponsmith','TECH','The required skill for repairing and maintaining weapons of all types. At level +2, you can do repairs and field stripping. At level +6, you can repair all types of weapons and make simple modifications. At level +8. You can design your own weapons to order.');

-- Career Skills
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Handgun',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Submachinegun',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Rifle',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Melee',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Stealth',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Boxing',1,1);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Wrestling',1,1);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Judo',1,1);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Aikido',1,1);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Karate',1,1);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Tea Kwon Do',1,1);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Pilot',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Awareness/Notice',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Soldier','Athletics',null,null);

insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Thug','Brawling',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Thug','Endurance',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Thug','Strength Feat',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Thug','Melee',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Thug','Driving',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Thug','Streetwise',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Thug','Intimidate',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Thug','Resist Torture/Drugs',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Thug','Handgun',null,null);

insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Rogue','Pick Lock',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Rogue','Stealth',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Rogue','Pick Pocket',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Rogue','Hide/Evade',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Rogue','Dodge & Escape',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Rogue','Awareness/Notice',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Rogue','Shadow/Track',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Rogue','Bluff',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Rogue','Disguise',null,null);

insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Hackman','Programming',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Hackman','Electronic Security',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Hackman','Analytics',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Hackman','System Knowledge',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Hackman','Database Search',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Hackman','Electronics',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Hackman','Mathematics',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Hackman','Gamble',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Hackman','Forgery',null,null);

insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Techie','Physics',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Techie','Engineering',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Techie','Basic Tech',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Techie','Electronics',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Techie','Weaponsmith',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Techie','Demolitions',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Techie','Operate Heavy Machinery',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Techie','Chemistry',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Techie','Pilot',null,null);

insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Medic','Natural Medicine',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Medic','Pharmaceuticals',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Medic','First Aid',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Medic','Diagnosis',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Medic','Surgery',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Medic','Biology',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Medic','Anthropology',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Medic','Chemistry',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Medic','Interview',null,null);

insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Corporate','Finance',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Corporate','General Knowledge',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Corporate','Analytics',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Corporate','Social',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Corporate','Leadership',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Corporate','Human Perception',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Corporate','Bluff',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Corporate','Interview',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Corporate','Wardrobe & Style',null,null);

insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Artist','Film & Draw',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Artist','Oratory',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Artist','Play Instrument',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Artist','Dance',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Artist','Composition',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Artist','Persuasion & Fast Talk',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Artist','Perform',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Artist','Seduction',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Artist','Personal Grooming',null,null);

insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Activist','Sociology',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Activist','Political Science',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Activist','Oratory',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Activist','Persuasion & Fast Talk',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Activist','Psychology',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Activist','Teaching',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Activist','Social',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Activist','General Knowledge',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Activist','Leadership',null,null);

insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Database Search',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Interview',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Analytics',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','General Knowledge',null,null);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Mathematics',1,5);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Physics',1,5);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Chemistry',1,5);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Biology',1,5);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Anthropology',1,5);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Economics',1,5);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','History',1,5);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Geology',1,5);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Psychology',1,5);
insert into tinfoilpunk_careerskill (role_id,skill_id,alt,alt_no) values ('Scientist','Sociology',1,5);

-- Wounds
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Light', 'Lite', 0);
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Serious', 'Srs', -1);
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Critical', 'Crt', -2);
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Mortal 0', 'Mrt0', -3);
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Mortal 1', 'Mrt1', -4);
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Mortal 2', 'Mrt2', -5);
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Mortal 3', 'Mrt3', -6);
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Mortal 4', 'Mrt4', -7);
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Mortal 5', 'Mrt5', -8);
insert into tinfoilpunk_wound (id,short,stun_save_mod) values ('Mortal 6', 'Mrt6', -9);

-- Weapon Types
insert into tinfoilpunk_weapontype (id, name) values ('P','Pistol');
insert into tinfoilpunk_weapontype (id, name) values ('SMG','Submachinegun');
insert into tinfoilpunk_weapontype (id, name) values ('SHG','Shotgun');
insert into tinfoilpunk_weapontype (id, name) values ('RIF','Rifle');
insert into tinfoilpunk_weapontype (id, name) values ('HVY','Heavy Weapon');
insert into tinfoilpunk_weapontype (id, name) values ('MEL','Melee Weapon');
insert into tinfoilpunk_weapontype (id, name) values ('EX','Exotic Weapon');

-- Weapon concealability
insert into tinfoilpunk_weaponconcealability (id, name) values ('P','Pocket, Pants Leg or Sleeve');
insert into tinfoilpunk_weaponconcealability (id, name) values ('J','Jacket, Coat or Shoulder Rig');
insert into tinfoilpunk_weaponconcealability (id, name) values ('L','Long Coat');
insert into tinfoilpunk_weaponconcealability (id, name) values ('N','Can''t be hidden');

-- Weapon Availability
insert into tinfoilpunk_weaponavailability (id,name,info) values ('E','Excellent','Can by found almost anywhere');
insert into tinfoilpunk_weaponavailability (id,name,info) values ('C','Common','Can by found in most sports & gun stores or on the Street');
insert into tinfoilpunk_weaponavailability (id,name,info) values ('P','Poor','Specialty weapons, black market, stolen military');
insert into tinfoilpunk_weaponavailability (id,name,info) values ('R','Rare','Stolen, one of a kind, special military issue, may by highly illegal');

-- Weapon reliability
insert into tinfoilpunk_weaponreliability (id, name) values ('VR','Very Reliable');
insert into tinfoilpunk_weaponreliability (id, name) values ('ST','Standard');
insert into tinfoilpunk_weaponreliability (id, name) values ('UR','Unreliable');

-- Weapon subtypes
insert into tinfoilpunk_weaponsubtype (id, name) values ('L','Light');
insert into tinfoilpunk_weaponsubtype (id, name) values ('M','Medium');
insert into tinfoilpunk_weaponsubtype (id, name) values ('H','Heavy');
insert into tinfoilpunk_weaponsubtype (id, name) values ('VH','Very Heavy');

-- Weapons
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('BudgetArms C-13','P','L',-1,'P','E','1D6','5mm',8,2,'ST','50m',75,'Light duty autopistol used as a holding and "lady''s gun".');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Dai Lung Cybermag 15','P','L',-1,'P','C','1D6+1','6mm',10,2,'UR','50m',50,'Cheap Hong Kong knockoff, often used boosters and other street trash.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Federated Arms X-22','P','L',0,'P','E','1D6+1','6mm',10,2,'ST','50m',150,'The ubiquitous "Polymer-one-shot" cheap plastic pistol. Available in different colors.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Militech Arms Avenger','P','M',0,'J','E','2D6+1','9mm',10,2,'VR','50m',250,'Well-made autopistol with good range and accuracy. A professional''s gun.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Dai Lung Streetmaster','P','M',0,'J','E','2D6+3','10mm',12,2,'UR','50m',250,'Another Dai Lung cheapie, built for the street.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Federated Arms X-9mm','P','M',0,'J','E','2D6+1','9mm',12,2,'ST','50m',300,'Saturday Solo''s gun, used as a standard military sidearm in the U.S. and E.C.C.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('BudgetArms Auto 3','P','H',-1,'J','E','3D6','11mm',8,2,'UR','50m',350,'It''s cheap, It''s powerful, It blows up sometimes. What else do you want?');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Sternmeyer Type 35','P','H',0,'J','C','3D6','11mm',8,2,'VR','50m',400,'Rugged, reliable, with excellent stopping power. Another fine E.C.C. product from the United Germanies.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Armalite 44','P','VH',0,'J','E','4D6+1','12mm',8,1,'ST','50m',450,'Designed as an alternate to the 1998 U.S. Army sidearm trials. A solid contender.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Colt AMT Model 2000','P','VH',0,'J','C','4D6+1','12mm',8,1,'VR','50m',500,'Now the standard officer''s sidearm for the U.S. Army, the M-2000 served well in the Central American Wars.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Uzi Miniauto 9','SMG','L',1,'J','E','2D6+1','9mm',30,35,'VR','150m',475,'Uzi''s entry into the 21st century, all plastic, with a rotary electric clip and adjustable trigger. The choice for many security Solos.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('H&K MP-2013','SMG','L',1,'J','C','2D6+3','10mm',35,32,'ST','150m',450,'Heckler&Koch''s updating of the MP-5K classic, with compound plastics and built in silencing.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Fed. Arms Tech Assault II','SMG','L',1,'J','C','1D6+1','6mm',50,25,'ST','150m',400,'An updated version of the venerable Tech Assault I, features larger clip, bet-ter autofire, no melting. Honest.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Arasaka Minami 10','SMG','M',0,'J','E','2D6+3','10mm',40,20,'VR','200m',500,'The standard Arasaka Security weapon, found worldwide. A good, all round weapon.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('H&K MPK-9','SMG','M',1,'J','C','2D6+1','9mm',35,25,'ST','200m',520,'A light composite submachinegun with integral sights. Used by many Euro Solos.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Sternmeyer SMG 21','SMG','H',-1,'L','E','3D6','11mm',30,15,'VR','200m',500,'Sternmeyer''s best entry in the anti-terrorist category, with wide use on C-SWAT teams and PsychoSquads');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('H&K MPK-11','SMG','H',0,'L','C','4D6+1','12mm',30,20,'ST','200m',700,'Possibly the most used Solo''s gun in existence, the MPK-11 can be modified into four different designs, including a bullpup configuration, standard SMG, an assault carbine, and a grenade launcher mount.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Ingram MAC 14','SMG','H',-2,'L','E','4D6+1','12mm',20,10,'ST','200m',650,'Updated MAC-10, with composite body and cylindrical feeding magazine.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Militech Ronin Light Assault','RIF','L',1,'N','C','5D6','5.56',35,30,'VR','400m',450,'A light, all purpose update, similar to the M-16B.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('AKR-20 Medium Assault','RIF','M',0,'N','C','5D6','5.56',30,30,'ST','400m',500,'A plastic and carbon fiber update of the AKM, distributed throughout the re-mains of the Soviet Bloc.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('FN -RAL Heavy Assault Rifle','RIF','H',-1,'N','C','6D6+2','7.62',30,30,'VR','400m',600,'The standard NATO assault weapon for battlefield work. Bullpup design, collapsing stock.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Kalishnikov A-80 Hvy. Rifle','RIF','H',-1,'N','E','6D6+2','7.62',35,25,'ST','400m',550,'Another Soviet retread, with improved sighting and lightened with composites');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Arasaka Rapid Assault 12','SHG',null,-1,'N','C','4D6','00',20,10,'ST','50m',900,'A high powered auto-shotgun with lethal firepower. Used by Arasaka worldwide. Another good reason to avoid the Boys in Black.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Sternmeyer Stakeout 10','SHG',null,-2,'N','R','4D6','00',10,2,'ST','50m',450,'Light duty stakeout shotgun, used by city police departments.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Barrett-Arasaka Light 20mm','HVY',null,0,'N','R','4D10', 'AP 20/9mm',10,1,'VR','450m',2000,'The cyberpsycho hunter''s favorite. Almost 2 meters long, this "cannon" fires a depleted uranium shell at super-sonic speeds. Heavy AP sub-caliber penetrator damages armor 2 pts/hit.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Scorpion 16 Missile Launcher','HVY',null,-1,'N','R','7D10',null,1,1,'VR','1km',3000,'The third generation of the Stinger missile launcher, this shoulder arm fires one missile.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Militech Arms RPG-A','HVY',null,-2,'N','R','6D10',null,1,1,'VR','750m',1500,'Shoulder-mounted, rocket-powered grenade launcher. Heavily used in the Central American conflicts under the name RPG-A.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Frag Grenade','HVY',null,0,'P','P','7D6',null,1,1,'VR','Throw',30,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Incendiary Grenade','HVY',null,0,'P','P','4D6 (3t)',null,1,1,'VR','Throw',30,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Stun Grenade','HVY',null,0,'P','P','-5 Stun',null,1,1,'VR','Throw',30,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Dazzle Grenade','HVY',null,0,'P','P','Blind (4t)',null,1,1,'VR','Throw',30,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Sonic Grenade','HVY',null,0,'P','P','Deafened (4t)',null,1,1,'VR','Throw',30,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Nausea Grenade','HVY',null,0,'P','P','-4 REF',null,1,1,'VR','Throw',30,'Illness');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Teargas Grenade','HVY',null,0,'P','P','-2 REF',null,1,1,'VR','Throw',30,'Tearing');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Sleepgas Grenade','HVY',null,0,'P','P','Sleep',null,1,1,'VR','Throw',30,'Half effect is drowsiness, -2 to all stats');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Biotoxin I Grenade','HVY',null,0,'P','P','4D6',null,1,1,'VR','Throw',30,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Biotoxin II Grenade','HVY',null,0,'P','P','8D6',null,1,1,'VR','Throw',30,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Nerve Gas Grenade','HVY',null,0,'P','P','8D10',null,1,1,'VR','Throw',30,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Grenade Launcher','HVY',null,0,'N','R',null,'Grenade',1,1,'ST','225m',150,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('C-6 Plastic Explosive','HVY',null,0,'P','P','8D10',null,1,1,'VR',null,100,'Grey block of plastique, can be deto-nated by timer, tripwire or signal.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Mine','HVY',null,0,'J','P','4D10',null,1,1,'VR',null,350,'Can be detonated by timer, tripwire, signal or motion detector.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('K-A F-253 Flamethrower','HVY',null,-2,'N','R','2D10+1',null,0,1,'ST','50m',1500,'Liquefied napalm sprayer. Back mounted and bulky. Does extra damage following initial hit.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Avante P-1135 Needlegun','P',null,0,'P','P',null,'Drugs',15,2,'ST','40m',200,'Lightweight, plastic, compressed air powered. Can be doped with drugs, poison.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Enertex AKM Power Squirt','P',null,-2,'J','C',null,'Drugs',50,1,'VR','10m',15,'A squirtgun. Yes, a powered squirtgun.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Nelspot "Wombat"','P',null,-1,'J','C',null,'Drugs',20,2,'UR','40m',200,'Paintball gun from hell. Can fire acid, paint, drugs, poison');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Miltech Electronics Taser','P',null,-1,'J','C','Stun',null,10,1,'ST','10m',60,'Zap. About the size of a small hand flashlight.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('EagleTech "Tomcat" C-Bow','EX',null,0,'N','C','4D6',null,12,1,'VR','150m',150,'Gyrobalanced, stabilized compound bow. Silent & deadly.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('EagleTech "Stryker" X-bow','EX',null,-1,'N','C','3D6+3',null,12,1,'VR','50m',220,'Plastic and bimetal crossbow. Silent, deadly, and you usually get your ammo back.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Kendachi Monoknife','MEL',null,1,'P','P','2D6',null,null,null,'VR','1m',200,'Mono-sectional crystal blade. Incredibly sharp. In the Japanese "tanto" style.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Kendachi MonoKatana','MEL',null,1,'N','R','4D6',null,null,null,'VR','1m',600,'Sword length version of monoblade. Resembles a hightech katana with a milky, nearly transparent blade.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('SPM-1 Battleglove','MEL',null,-2,'N','P','3D6/2D6',null,null,null,'VR','1m',900,'This is a large gauntlet covering the hand and forearm. It does 3D6 in crush damage, 2D6 punch damage, and has three spaces which can be used to store any standard cyberarm option.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Club','MEL',null,0,'L','C','1D6',null,null,null,null,'1m',0,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Knife','MEL','L',0,'P','C','1D6',null,null,null,null,'1m',20,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Sword','MEL',null,0,'N','C','2D6+2',null,null,null,null,'1m',200,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Axe','MEL',null,-1,'N','C','2D6+3',null,null,null,null,'1m',20,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Nunchaku/Tonfa','MEL',null,0,'L','C','3D6',null,null,null,null,'1m',15,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Naginata','MEL',null,0,'N','P','3D6',null,null,null,null,'2m',100,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Shuriken','MEL',null,0,'P','C','1D6/3',null,null,null,null,'Throw',3,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Switchblade','MEL',null,0,'P','C','1D6/2',null,null,null,null,'1m',15,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Brass knuckles','MEL',null,0,'P','C','1D6+2',null,null,null,null,'1m',10,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Sledgehammer','MEL',null,-1,'N','C','4D6',null,null,null,null,'1m',20,null);
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Chainsaw','MEL',null,-3,'N','C','4D6',null,null,null,null,'2m',80,null);

insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('S&W Combat Magnum','P',null,1,'J','C','2D6+3','.357',6,2,'VR','50m',null,'Designed for US Border Patrol use. the Combat Magnum is a popular choice among police officers. Its "small frame" and reliable action make it a best seller.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Liama Commanche','P',null,0,'J','C','4D6','.44',6,1,'ST','50m',null,'An excellent .44 revolver, used in home defense and police work. It''s long barrel makes it hard to conceal.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Colt .45 "Peacemaker"','P',null,0,'J','R','2D6+2','.45',6,1,'VR','50m',null,'The gun "that won the West", the .45 was the most common US sidearm throughout the 1800''s. A single action weapon, it must be cocked before firing, although later models had a flattened hammer allowing the gun to be fired by "fanning" the hammer.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Colt .38 Detective','P',null,1,'J','C','1D6+2','.38',6,1,'VR','50m',null,'The most commonplace police weapon for many years, the Colt .38 has many variants, including the smaller "Chief''s Special". With their high reliability, there are many of these guns still in circulation.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('C.O.P. .357 Derringer','P',null,0,'P','C','2D6+3','.357',4,2,'VR','50m',null,'Designed as a "holdout" for law enforcement agents, the COP uses a unique revolving firing pin arrangement. It''s small size makes it easily hidden.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('UZI','SMG',null,2,'J','C','2D6+1','9mm',30,20,'VR','150m',null,'Developed by the Israelis as a reliable export weapon, the Uzi is used worldwide by security forces, the US Secret Service, police and (unfortunately) terrorists and drug dealers.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Vz61 Skorpion','SMG',null,2,'J','P','1D6','.25',20,25,'VR','150m',null,'A standard military sidearm for the Soviet Bloc, the Skorpion is the worid''s smallest military SMG. It''s small ammunition size gives it excellent controllability. It is easily silenced and can be carried in a shoulder holster.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Ingram MAC 10','SMG',null,-1,'J','C','2D6+2','.45',30,5,'UR','150m',null,'A very small SMG used by covert units and terrorists. It can be easily silenced. However, it''s very large ammo size makes it very difficult to control when on full auto.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('H&K MP5','SMG',null,1,'L','C','2D6+1','9mm',30,20,'ST','150m',null,'Example of the H&K family of interchangeable SMGs.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Thompson M1','SMG',null,2,'N','C','2D6+2','.45',30,20,'VR','150m',null,'Standard US military SMG during WWII, the Thompson is rugged, reliable and easy to use. The M1928 version, of gangster fame, was less reliable (UR), but could carry a 5O round drum magazine.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Bushmaster','SMG',null,0,'J','R','4D6','5.56',30,20,'ST','150m',null,'A bullpup configured SMG designed to be fired one handed. The Bushmaster uses the M-16A1 clip, making it technically closer to an assault rifle than a submachinegun.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('FN-FAL','RIF',null,0,'N','E','6D6+2','7.56',20,21,'VR','400m',null,'Standard NATO rifle. A very deadly assault weapon, durable and handles well.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('AK-47','RIF',null,0,'N','E','5D6','7.565',30,20,'VR','400m',null,'Standard Soviet military rifle, exported worldwide, particularly to Soviet client-slates. Reliable, rugged, but rather difficult to control, the AK-47 is probably the most well known weapon of it''s type in the world.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('M-16A','RIF',null,2,'N','C','4D6','5.56',30,25,'UR','400m',null,'Standard US military rifle since the 1960''s, the M-16 has high accuracy and a staggering ROF. A built in "tumble" effect compensates for the light 5.56 round. Earlier M-16 models were cantankerous and unreliable in the extreme, with an accuracy of 1, not 2. The Ar-15 and the AR-180 are civilian models used by police and home defense.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Styer Aug','RIF',null,2,'N','C','4D6','5.56',30,20,'VR','400m',null,'A bullpup configured rifle using high tech plastics and aluminum, the AUG is the wave of the future. The scope is built in, giving it great accuracy, while it''s rugged plastic construction gives it reliability and strength.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('Winchester M70','RIF',null,3,'N','C','5D6+1','30-06',5,1,'VR','400m',null,'A basic scoped hunting rifle, used to hunt deer.');
insert into tinfoilpunk_weapon (id,w_type_id,w_subtype_id,accuracy,w_concealability_id,w_availability_id,damage,ammo,shots,rof,w_reliability_id,weapon_range,cost,info) values ('CAWS','SHG',null,0,'N','R','4D6','00',10,10,'ST','50m',null,'Close in Assault Weapon, designed for house to house work, crowd suppression. Scope is built in. making it very accurate for type.');

-- Armor parts
insert into tinfoilpunk_armorpart (id) values ('Vest');
insert into tinfoilpunk_armorpart (id) values ('Jacket');
insert into tinfoilpunk_armorpart (id) values ('Pants');
insert into tinfoilpunk_armorpart (id) values ('Helmet');

-- Armor materials
insert into tinfoilpunk_armormaterial (id,lvl) values ('Leather',1);
insert into tinfoilpunk_armormaterial (id,lvl) values ('Light Kevlar',2);
insert into tinfoilpunk_armormaterial (id,lvl) values ('Steel',2);
insert into tinfoilpunk_armormaterial (id,lvl) values ('Medium Kevlar',3);
insert into tinfoilpunk_armormaterial (id,lvl) values ('Flack',3);
insert into tinfoilpunk_armormaterial (id,lvl) values ('Nylon',3);
insert into tinfoilpunk_armormaterial (id,lvl) values ('Heavy Kevlar',4);

-- Armor
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Vest','Leather',0,4,0,0,0,0,0,50);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Jacket','Leather',0,4,4,4,0,0,0,70);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Pants','Leather',0,0,0,0,4,4,0,30);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Vest','Light Kevlar',0,10,0,0,0,0,0,90);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Jacket','Light Kevlar',0,14,14,14,0,0,0,150);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Pants','Light Kevlar',0,0,0,0,10,10,0,70);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Helmet','Steel',14,0,0,0,0,0,0,20);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Vest','Flack',0,20,0,0,0,0,1,200);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Jacket','Medium Kevlar',0,18,18,18,0,0,1,200);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Pants','Flack',0,0,0,0,20,20,1,200);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Helmet','Nylon',20,0,0,0,0,0,0,100);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Jacket','Heavy Kevlar',0,20,20,20,0,0,2,250);
insert into tinfoilpunk_armor (part_id,material_id,sp_head,sp_torso,sp_larm,sp_rarm,sp_lleg,sp_rleg,ev,cost) values ('Vest','Heavy Kevlar',0,25,0,0,0,0,3,250);

-- create table npc_weapon_roll (
--     pts_from number,
--     pts_to number,
--     weapon_type text,
--     weapon_subtype text
-- );
-- insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (1,1,'MEL','L');
-- insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (2,2,'P','L');
-- insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (3,3,'P','M');
-- insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (4,5,'P','H');
-- insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (6,6,'SMG','L');
-- insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (7,7,'RIF','L');
-- insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (8,8,'RIF','M');
-- insert into npc_weapon_roll (pts_from, pts_to, weapon_type, weapon_subtype) values (9,null,'RIF','H');

--create table npc_armor_roll (
--    pts_from number,
--    pts_to number,
--    material text
--);
--
--insert into npc_armor_roll (pts_from, pts_to, material) values (1,2,'Leather');
--insert into npc_armor_roll (pts_from, pts_to, material) values (3,4,'Light Kevlar');
--insert into npc_armor_roll (pts_from, pts_to, material) values (5,7,'Medium Kevlar');
--insert into npc_armor_roll (pts_from, pts_to, material) values (8,9,'Heavy Kevlar');
--insert into npc_armor_roll (pts_from, pts_to, material) values (10,null,'MetalGear');
--
--
--create view weapon_cat_sort as
--    select 'Light Pistols' cat, 1 idx union all
--    select 'Medium Pistols' cat, 2 idx union all
--    select 'Heavy Pistols' cat, 3 idx union all
--    select 'Very Heavy Pistols' cat, 4 idx union all
--    select 'Light Submachineguns' cat, 5 idx union all
--    select 'Medium Submachineguns' cat, 6 idx union all
--    select 'Heavy Submachineguns' cat, 7 idx union all
--    select 'Shotguns' cat, 8 idx union all
--    select 'Light Rifles' cat, 9 idx union all
--    select 'Medium Rifles' cat, 10 idx union all
--    select 'Heavy Rifles' cat, 11 idx union all
--    select 'Heavy Weapons' cat, 12 idx union all
--    select 'Light Melee Weapons' cat, 13 idx union all
--    select 'Melee Weapons' cat, 14 idx union all
--    select 'Exotic Weapons' cat, 15 idx union all
--    select 'Pistols' cat, 16 idx union all
--    select 'Submachineguns' cat, 17 idx union all
--    select 'Rifles' cat, 18 idx
--;

DROP TABLE IF EXISTS users;

CREATE TABLE users 
(
    user_id INTEGER TEXT PRIMARY KEY,
    password TEXT NOT NULL,
    clearance INTEGER NOT NULL,
    is_employee TEXT NOT NULL,
    last_login_time TEXT,
    message TEXT
);

INSERT INTO users(user_id, password, clearance, is_employee) VALUES ('som','pbkdf2:sha256:260000$9F64S7TPPiUsAwob$ee942a566762eed91c7b486756a99ae03bc6ad8c175984e18ed0553846a57bb2',3,'true');
INSERT INTO users(user_id, password, clearance, is_employee) VALUES ('benny','pbkdf2:sha256:260000$9F64S7TPPiUsAwob$ee942a566762eed91c7b486756a99ae03bc6ad8c175984e18ed0553846a57bb2',1,'false');
INSERT INTO users(user_id, password, clearance, is_employee) VALUES ('betty','pbkdf2:sha256:260000$9F64S7TPPiUsAwob$ee942a566762eed91c7b486756a99ae03bc6ad8c175984e18ed0553846a57bb2',2,'false');

DROP TABLE IF EXISTS scp_objects;

CREATE TABLE scp_objects(
   code           VARCHAR(7) NOT NULL PRIMARY KEY
  ,title          TEXT NOT NULL
  ,obj_class      TEXT NOT NULL
  ,text           TEXT NOT NULL
  ,image_captions TEXT
  ,rating         INTEGER
  ,tags           TEXT NOT NULL
  ,link           TEXT NOT NULL
);

INSERT INTO scp_objects(code,title,obj_class,text,image_captions,rating,tags,link) VALUES ('SCP-131','"The Eye Pods"','Safe', 'Special Containment Procedures: No special safety procedures are to be taken with SCP-131-A and SCP-131-B. They are free to travel about Site-19 so long as they do not attempt to enter any restricted areas or attempt to leave the facility. Casual contact with the subjects is permitted, but it is recommended that such contact be kept to a minimum to prevent the creatures from forming an attachment to personnel. Hourly tabs are to be kept on subjects at all times; failure to account for their presence at these times constitutes a level one lockdown situation. Any report of abuse or mistreatment of the subjects will result in a harsh reprimand. 

Description: SCP-131-A and SCP-131-B (affectionately nicknamed the "Eye Pods" by personnel) are a pair of teardrop-shaped creatures roughly 30 cm (1 ft) in height, with a single blue eye in the middle of their bodies. SCP-131-A is burnt orange in color while SCP-131-B is mustard yellow. At the base of each creature is a wheel-like protrusion which allows for locomotion, suggesting that the creatures may be biomechanical in origin. The subjects can move surprisingly fast, covering over 60 m (200 ft) in a matter of seconds. The subjects, however, lack a braking system, which has led to some rather spectacular, if not overly amusing, mishaps involving the creatures. The subjects have also shown the ability to climb sheer surfaces, and have gotten lost in the air vents on more than one occasion. 
 The subjects seem to have the intelligence of common house cats and are insatiably curious. Most of the time they simply roll around the facility, observing personnel at work and catching peeks at other Safe class SCPs. The subjects seem to be able to communicate with each other via an untranslatable high-pitched babbling. The subjects have never been observed to blink, even in laboratories when the subjects have been videotaped for over 18 consecutive hours. 

The subjects seem to respond well to any affection given to them and will quickly bond to the giver of said affection, much in the same way a puppy bonds with a human being. They will follow anyone or anything they''ve made a bond with anywhere, even into normally restricted areas. Although curious, the subjects can sense danger in their general vicinity, and if the object of their bond begins to approach something they register as dangerous (e.g., Euclid or Keter class objects) they will swarm around their bonded companion''s feet (or appropriate extremities) while babbling in a panicked tone, as if to warn them. Because of the daily dangers faced by Site-19 staff in dealing with Euclid and Keter class objects, it is recommended that staff avoid making attempts to bond with the subjects, as it can pose a distraction during delicate operations and experiments and may pose a danger to the subjects themselves (see Addendum 131-1). If the subjects are ignored by their bonded target long enough, they will eventually lose interest and return to their normal activities. 

It should be noted that the subjects require no real care or maintenance from the site staff. They do not eat, leave droppings, or even sleep. It would seem that the only sustenance they require is visual stimulation (although this requires further study to verify). 

Subjects SCP-131-A and SCP-131-B were found in a cornfield outside ████████████ in the year 19██. They were promptly transported to Site-19 via [DATA EXPUNGED] and were then downgraded to Safe class and given free rein across the site once it became clear they were not broadcasting what they saw to any hostile foreign powers. 

Addendum 131-1: During an incident that took place on ██/██/████, the subjects followed one of the cleaning staff on routine cleaning of the container of SCP-173. After their normal attempts to warn the cleaner of the danger were ignored, the creatures rushed into the container in front of him and the other two personnel on duty. Once inside, the staff members observed the subjects sitting in front of SCP-173 and watching it intently, as if aware that it could only move if unobserved. The cleaners ignored the presence of the subjects and continued with the bi-weekly cleaning as per standard procedures. When the cleaning crew left, the subjects did as well, rolling backward slowly and never taking their eyes off of SCP-173. Current applications of SCP-131-A and SCP-131-B as "wardens" for SCP-173 (and perhaps other SCP which require constant observation, such as SCP-689) are being considered. 
', NULL, 933, '_cc _licensebox autonomous empathic safe scp sentient the-sculpture', 'https://scp-wiki.wikidot.com/scp-131');

INSERT INTO scp_objects(code,title,obj_class,text,image_captions,rating,tags,link) VALUES ('SCP-049','"Plague Doctor"','Euclid', 'Special Containment Procedures: SCP-049 is contained within a Standard Secure Humanoid Containment Cell in Research Sector-02 at Site-19. SCP-049 must be sedated before any attempts to transport it. During transport, SCP-049 must be secured within a Class III Humanoid Restriction Harness (including a locking collar and extension restraints) and monitored by no fewer than two armed guards. 
 
While SCP-049 is generally cooperative with most Foundation personnel, outbursts or sudden changes in behaviour are to be met with elevated force. Under no circumstances should any personnel come into direct contact with SCP-049 during these outbursts. In the event SCP-049 becomes aggressive, the application of lavender (L. multifida) has been shown to produce a calming effect on the entity. Once calmed, SCP-049 generally becomes compliant, and will return to containment with little resistance. 
 
In order to facilitate the ongoing containment of SCP-049, the entity is to be provided with the corpse of a recently deceased animal (typically a bovine or other large mammal) once every two weeks for study. Corpses that become instances of SCP-049-2 are to be removed from SCP-049''s containment cell and incinerated. SCP-049 is no longer permitted to interact with human subjects, and requests for human subjects are to be denied. 

Temporary Containment Procedure Update: (See Addendum 049.3) Per Containment Committee Order 049.S19.17.1, SCP-049 is no longer permitted to interact directly with any members of Foundation staff, nor is it to be provided with any additional corpses to be used in its surgeries. This order shall persist indefinitely, until such time a consensus regarding the ongoing containment of SCP-049 can be reached. 

 Description: SCP-049 is a humanoid entity, roughly 1.9 meters in height, which bears the appearance of a medieval plague doctor. While SCP-049 appears to be wearing the thick robes and the ceramic mask indicative of that profession, the garments instead seem to have grown out of SCP-049''s body over time1, and are now nearly indistinguishable from whatever form is beneath them. X-rays indicate that despite this, SCP-049 does have a humanoid skeletal structure beneath its outer layer.

 SCP-049 is capable of speech in a variety of languages, though tends to prefer English or medieval French2. While SCP-049 is generally cordial and cooperative with Foundation staff, it can become especially irritated or at times outright aggressive if it feels that it is in the presence of what it calls the "Pestilence". Although the exact nature of this Pestilence is currently unknown to Foundation researchers, it does seem to be an issue of immense concern to SCP-049. 

 SCP-049 will become hostile with individuals it sees as being affected by the Pestilence, often having to be restrained should it encounter such. If left unchecked, SCP-049 will generally attempt to kill any such individual; SCP-049 is capable of causing all biological functions of an organism to cease through direct skin contact. How this occurs is currently unknown, and autopsies of SCP-049''s victims have invariably been inconclusive. SCP-049 has expressed frustration or remorse after these killings, indicating that they have done little to kill "The Pestilence", though will usually seek to then perform a crude surgery on the corpse using the implements contained within a black doctor''s bag it carries on its person at all times3. While these surgeries are not always "successful", they often result in the creation of instances of SCP-049-2. 

 SCP-049-2 instances are reanimated corpses that have been operated on by SCP-049. These instances do not seem to retain any of their prior memories or mental functions, having only basic motor skills and response mechanisms. While these instances are generally inactive, moving very little and in a generally ambulatory fashion, they can become extremely aggressive if provoked, or if directed to by SCP-049. SCP-049-2 instances express active biological functions, though these are vastly different from currently understood human physiology. Despite these alterations, SCP-049 often remarks that the subjects have been "cured". 

 Addendum 049.1: Discovery 

 SCP-049 was discovered during the investigation of a series of unknown disappearances in the town of Montauban in southern France. During a raid on a local home, investigators found several instances of SCP-049-2, as well as SCP-049. While law enforcement personnel engaged the hostile 049-2 instances, SCP-049 was noted as watching the engagement and taking notes in its journal. After all of the 049-2 instances were dispatched, SCP-049 willingly entered Foundation custody. 

 The following interview was conducted by Dr. Raymond Hamm during the initial investigation. 
 Interviewer: Dr. Raymond Hamm, Site-85 
 Interviewee: SCP-049 

 [BEGIN LOG] 

 SCP-049: (In French) So then, how should we begin? An introduction? 

 Dr. Hamm: (Aside) Is that French? Can we get a translator- 

 SCP-049: (In English) The King''s English! No need for translation, sir, I can speak it well enough. 

 Dr. Hamm: Good. My name is Dr. Raymond Hamm, and I- 

 SCP-049: Ah! A doctor! A like-minded individual, no doubt. Wherein is your speciality, sir? 

 Dr. Hamm: Cryptobiology, why- 

 SCP-049: (Laughs) A medical man, such as myself. Wonders abound! And here I worried I had been abducted by common street thugs! (Looks around the room) This place, then. This is your laboratory? I 
had wondered, as clean as it is, and with such little trace of the Pestilence here. 

 Dr. Hamm: The Pestilence? What do you mean? 

 SCP-049: The Scourge! The Great Dying. Come now, you know, the, uh... (taps temple furiously) ...what is it they call it, the... the... ah, no matter. The Pestilence, yes. It abounds outside these walls, you know. So many have succumbed, and many more will continue to, until such time as a perfect cure can be developed. (Leans back in its chair) Fortunately, I am very close. It is my duty in life to rid the 
world of it, you see. The Cure To End All Cures! 

 Dr. Hamm: When you say "The Great Dying", are you talking about the bubonic plague? 

 SCP-049: (Pauses) I don''t know what that is. 

 Dr. Hamm: I see. Right, well, the entities our agents encountered at that house, they were dead when you encountered them, yes? And you reanimated them? 

 SCP-049: Hrmm, in a manner of speaking. You see things too simply, doctor! Expand your horizons. Life and death, sickness and health, these are amateur terms for amateur physicians. There is only one ailment that exists in the world of men, and that is the Pestilence. And nothing else! Make no mistake, they were very ill, all of them. 

 Dr. Hamm: You think you cured those people? 

 SCP-049: Indeed. My cure is most effective. 

 Dr. Hamm: The things we recovered were not human. 

 SCP-049: (Pauses and glares at Dr. Hamm) Yes, well, it is not a perfect cure. But that will come with time. And further experimentation! I have spent a lifetime developing my methods, Dr. Hamm, and will spend a lifetime more, if necessary. Now, we have wasted too much time. There is work to do! I will require a laboratory of my own, one where I can continue my research unimpeded. And assistants, of course, though I can provide those on my own, in time. (Laughs) 

 Dr. Hamm: I don''t think our organization will be willing to- 

 SCP-049: Nonsense. We are all men of science. Fetch your coat and show me to my quarters, doctor. (Gestures with pointed stick) Our work begins now! 

 [END LOG] 

 Interviewer''s Note: While SCP-049 is capable of communicating in a very human way, there is a strange sense of unease that one experiences when in its presence. Make no mistake, there is something very uncanny about this entity indeed. 
 Additionally, we''ve confiscated that pointed stick that SCP-049 keeps waving around. Part of this was due to standard confiscation protocols for the possessions of anomalies, and part because 049 really is a menace swinging it around like he does. The entity was displeased at first, but after we made some concessions in providing it with "test subjects" (which are, admittedly, more for the benefit of our own research) it warmed up to the idea. 
', 'X-Ray imaging of SCP-049''s facial structure.', 3860, '_cc _licensebox audio biological chemical co-authored contagion euclid humanoid plague-doctor reanimation rewrite sapient scp sentient tactile', 'https://scp-wiki.wikidot.com/scp-049');

INSERT INTO scp_objects(code,title,obj_class,text,image_captions,rating,tags,link) VALUES ('SCP-173','"The Sculpture"','Euclid', 'Special Containment Procedures: Item SCP-173 is to be kept in a locked container at all times. When personnel must enter SCP-173''s container, no fewer than 3 may enter at any time and the door is to be relocked behind them. At all times, two persons must maintain direct eye contact with SCP-173 until all personnel have vacated and relocked the container. 

Description: Moved to Site-19 1993. Origin is as of yet unknown. It is constructed from concrete and rebar with traces of Krylon brand spray paint. SCP-173 is animate and extremely hostile. The object cannot move while within a direct line of sight. Line of sight must not be broken at any time with SCP-173. Personnel assigned to enter container are instructed to alert one another before blinking. Object is reported to attack by snapping the neck at the base of the skull, or by strangulation. In the event of an attack, personnel are to observe Class 4 hazardous object containment procedures. 

Personnel report sounds of scraping stone originating from within the container when no one is present inside. This is considered normal, and any change in this behaviour should be reported to the acting HMCL supervisor on duty. 

The reddish brown substance on the floor is a combination of feces and blood. Origin of these materials is unknown. The enclosure must be cleaned on a bi-weekly basis.', NULL, 7663, '_licensebox autonomous euclid featured hostile observational scp sculpture the-sculpture', 'https://scp-wiki.wikidot.com/scp-173');

INSERT INTO scp_objects(code,title,obj_class,text,image_captions,rating,tags,link) VALUES ('SCP-682','"Hard-to-Destroy Reptile"','Keter', 'Special Containment Procedures: SCP-682 must be destroyed as soon as possible. At this time, no means available to SCP teams are capable of destroying SCP-682, only able to cause massive physical damage. SCP-682 should be contained within a 5 m x 5 m x 5 m chamber with 25 cm reinforced acid-resistant steel plate lining all inside surfaces. The containment chamber should be filled with hydrochloric acid until SCP-682 is submerged and incapacitated. Any attempts of SCP-682 to move, speak, or breach containment should be reacted to quickly and with full force as called for by the circumstances. 
 
Personnel are forbidden to speak to SCP-682, for fear of provoking a rage-state. All unauthorized personnel attempting to communicate to SCP-682 will be restrained and removed by force. 
 
Due to its frequent attempts at containment breach, difficulty of containment and incapacitation, and high threat of Foundation Exposure, SCP-682 is to be contained in site [REDACTED]. The Foundation will use the best of its resources to maintain all land within fifty (50) kilometers clear of human development. 
 
Description: SCP-682 is a large, vaguely reptile-like creature of unknown origin. It appears to be extremely intelligent, and was observed to engage in complex communication with SCP-079 during their limited time of exposure. SCP-682 appears to have a hatred of all life, which has been expressed in several interviews during containment. (See Addendum 682-B). 
 
SCP-682 has always been observed to have extremely high strength, speed, and reflexes, though exact levels vary with its form. SCP-682''s physical body grows and changes very quickly, growing or decreasing in size as it consumes or sheds material. SCP-682 gains energy from anything it ingests, organic or inorganic. Digestion seems to be aided by a set of filtering gills inside of SCP-682''s nostrils, which are able to remove usable matter from any liquid solution, enabling it to constantly regenerate from the acid it is contained in. SCP-682''s regenerative capabilities and resilience are staggering, and SCP-682 has been seen moving and speaking with its body 87% destroyed or rotted. 
 
In case of containment breach, SCP-682 is to be tracked and re-captured by all available Mobile Task Forces, and no teams with fewer than seven (7) members are cleared to engage it. To date (██-██-████), attempted breaches have numbered at seventeen (17), while successful breaches have numbered at six (6). (See Addendum 682-D). 
 
Addendum 682-B: Portion of recorded transcript of ██████. 
 <Begin Log, skip to 00h-21m-52s> 
 Dr.██████: Now, why did you kill those farmers? 
 SCP-682: (No verbal communication) 
 Dr.██████: If you don''t talk now, we will remove you from this attempt and place you back into- 
 SCP-682: (Incomprehensible) 
 Dr.██████: Pardon? (Motions to move microphone closer) 
 SCP-682: (Incomprehensible) 
 Dr.██████: Speak up. (To Personnel D-085) Move the mic up closer. 
 SCP-682:  ...they were (Incomprehensible)... 
 Dr.██████: (To Personnel D-085) That microphone has only so much gain, move it closer to it! 
 Personnel D-085: His throat''s messed up man, look at it! He ain''t talking- (Gasps and screams) 
 SCP-682: (Appearing to assault D-085''s body)  ...they were… disgusting... 
 Dr.██████: (Retreats from the room) 
 <End Log> 
 
Addendum 682-D: Breaches with SCP-682: 
 1: First Occurrence,██-██-████: Handled by Agent ███████, Agent ███, Agent ████████ (KIA), Personnel D-129 (KIA), Personnel D-027 (KIA), Personnel D-173 (KIA), Personnel D-200 (KIA), Personnel D-193 (KIA) 
 
2: Second Occurrence,██-██-████: Handled by Agent ███, Agent ████████████, Dr.███████, Personnel D-124, Personnel D-137 (KIA), Personnel D-201 (KIA), Personnel D-202 (KIA), Personnel D-203 (KIA) 
 
3: Third Occurrence,██-██-████: Handled by Agent ███████, MSgt█████████, Agent ████████, Agent ██████ (KIA), Personnel D-018 (KIA), Personnel D-211 (KIA), Personnel D-216 
 
4: Fourth Occurrence,██-██-████: Handled by Agent ████████, SSgt██████, TSgt█████, Pvt████████, Pvt█████, Lt.████████████, SSgt████████ (KIA), Col████████ (KIA), Pvt███████ (KIA), Pvt██████ (KIA), Agent ███ (KIA) 
 
5: Fifth Occurrence,██-██-████: Handled by Personnel D-221, Agent ██████████ (KIA), Agent ████████ (KIA), Agent ██████ (KIA), Personnel D-028 (KIA), Personnel D-111 (KIA), Personnel D-281 (KIA), Personnel D-209 (KIA) 
 
6: Sixth Occurrence,██-██-████: Handled by Agent ██████████, Agent ██████, Personnel D-291 (MIA), Agent ████████ (KIA), Agent █████████████ (KIA), Personnel D-299 (KIA), Personnel D-277 (KIA), Personnel D-278 (KIA), Personnel D-279 (KIA) 
 
Addendum 682-E: Termination Options: 
 Log of event 682-E18: Dr.█████ attempts to use SCP-409 on SCP-682. General ███, General ██████, and Dr.██████████ observing. 
 0400: Exposure. SCP-682 began to tear at the point of contact, causing massive trauma to the area. SCP-682 requests several times to know what it has been exposed to. 
 0800: Crystallization begins, spreading much slower than normal. 
 1200: SCP-682 shows signs of extreme pain, and begins having seizures 
 1300: Crystallization stops at 62% conversion. Crystallized area explodes, causing massive physical trauma to SCP-682 
 1400: SCP-682 recovers from exposure, despite the loss of limbs and organs. SCP-682 begins regeneration, stating that it will attempt to kill and consume all staff involved in Event 682-E18. 
 
SCP-682 appears to now be immune to SCP-409. Use of other SCP items to terminate SCP-682 must now first be tested on samples of SCP-682 before full-scale testing. 
 
In accordance the Dr.████████''s recommendations (see Document 27b-6), Dr.███████ and Dr.█████ have requested permission to attempt the termination of SCP-682 using SCP-689. The request is currently pending approval from the████████. 
 
It has also been suggested by Dr. Gears to use SCP-182 in an attempt to communicate with SCP-682. SCP-182 has expressed reluctance, and refuses to enter the containment center of SCP-682, if at all possible.', NULL, 3134, '_cc _licensebox adaptive alive audio co-authored hard-to-kill-reptile hostile indestructible keter reptilian sapient scp self-repairing sentient',
 'https://scp-wiki.wikidot.com/scp-682');

INSERT INTO scp_objects(code,title,obj_class,text,image_captions,rating,tags,link) VALUES ('SCP-3000','"Anantashesha"','Thaumiel', 'Special Containment Procedures: The area containing SCP-3000, currently a region of the Bay of Bengal roughly 300km in diameter, is to be routinely patrolled by Foundation naval vessels. Under no circumstances are civilians allowed to attempt deep sea exploration or diving efforts in the quarantined area. Individuals believed to have contacted SCP-3000 are to be contained, quarantined, and processed at Site-151. Individuals affected by the anomalous properties of SCP-3000 are to be held in containment indefinitely. 
 
The Foundation submarine SCPF Eremita is to monitor the location of the foremost section of SCP-3000, currently located within the Ganges Fan, roughly 0.7km beneath the Bay. The Eremita is tasked with carrying out the Atzak Protocol, and staffing regulations onboard the vessel are subject to the guidelines of that protocol. For a full description of the Atzak Protocol, see Addendum 3000.2.

There is currently no known cure for exposure to SCP-3000; as such, affected individuals should be contained and quarantined for further evaluation. Individuals stationed aboard the SCPF Eremita are not permitted to leave the vessel except for the purposes of carrying out the necessary procedures of the Atzak Protocol. Individuals who leave the vessel without proper authorization are to be considered lost. 
 
Under no circumstances should any individual interact with SCP-3000 without authorization. 
 
Description: SCP-3000 is a massive, aquatic, serpentine entity strongly resembling a giant moray eel (Gymnothorax javanicus). The full length of SCP-3000 is impossible to determine, but is hypothesized to be between 600 and 900 kilometers. The head of SCP-3000 measures roughly 2.5m in diameter, and sections of the body proper are as large as 10m in diameter. 
 
SCP-3000 is typically a sedentary creature, only moving its head in response to certain stimuli or during feeding. The majority of its body is located in and around the Ganges Fan1, and rarely moves at all. 
 
SCP-3000 is carnivorous, and despite its sedentary nature is capable of moving quickly to dispatch prey. Despite its size, it is hypothesized that SCP-3000 does not require sustenance to maintain its biological functions2. While SCP-3000 excretes a thin layer of a viscous, dark grey substance classified as Y-909 (see Addendum 3000.2 below) through its skin as it consumes prey, the end result of its digestive processes is currently unknown. 

SCP-3000 is a Class VIII cognitohazardous entity; direct observation of SCP-3000 may cause severe mental alterations in viewers. Individuals who directly observe SCP-3000, as well as any individuals within an uncertain distance of SCP-3000, experience inexplicable head pain, paranoia, general fear and panic, and memory loss or alteration.

Discovery: SCP-3000 was discovered in 1971, shortly after two Bangladeshi fishing boats and fifteen fishermen were reported missing after drifting near the Indian coast. As the country of Bangladesh had only been recently established at the time and had been subject to significant political persecution on the part of Pakistan, this incident received high profile media attention due to fears that it was a result of foreign aggression. Local coastal dispatch units could not locate the missing boats, fueling further media hysteria.

Foundation researchers stationed in Calcutta (now Kolkata) drew similarities between this disappearance and another incident two years earlier. A thorough search aided by Mariotte-Pashler Counters revealed the location of the two boats, as well as an unknown, previously undiscovered mass deep below the surface of the Bay of Bengal. Further investigation by Foundation divers discovered the existence of SCP-3000.

 The area was quickly secured, and current containment procedures were put in place in April of 1972; the Atzak Protocol was adapted in October of 1998.', 'SCPF Eremita diving towards contact site.', 2173, '_cc _licensebox alive animal aquatic biological co-authored cognitohazard empathic memory-affecting ophidian religious scp thaumiel visual', 'https://scp-wiki.wikidot.com/scp-3000');

INSERT INTO scp_objects(code,title,obj_class,text,image_captions,rating,tags,link) VALUES ('SCP-1762','"Where The Dragons Went"','Neutralised', 'Special Containment Procedures: SCP-1762-1 is held in a standard containment unit at Site-██. During the periods when SCP-1762-1 releases SCP-1762-2, video logs are to be recorded for future research. Although instances of SCP-1762-2 have been deemed harmless, they should not be allowed to exit their containment unit. 
 
Description: SCP-1762-1 is a plain, cardboard box that is 32 cm x 20 cm x 26 cm. It is spray-painted silver on the interior and exterior, and the words "HERE BE DRAGONS" are handwritten in black permanent marker on the lid of the container. Opening the lid of SCP-1762-1 when it is not in the process of a release reveals it to be empty. 
 
SCP-1762-1 will infrequently open and initiate a release of SCP-1762-2. During this time, the box will briefly emit a large amount of black smoke that quickly dissipates; it takes an average of twenty seconds for SCP-1762-2 to emerge after the smoke clears. 
 
SCP-1762-2 is the collective term applied to the beings that emerge from SCP-1762-1. All instances of SCP-1762-2 bear resemblance to various types of dragons, in both Eastern and Western depictions, albeit in forms similar to that of origami models. Analysis of SCP-1762-2 reveals that they are composed of Kami paper. After exiting SCP-1762-1, instances of SCP-1762-2 will fly together in large groups and interact playfully with any nearby personnel and each other. 
 
SCP-1762-2 vary in length from nine to thirty centimeters; all are capable of sustained flight once they exit SCP-1762-1, and have been recorded attaining speeds of 15 km/h. The number of SCP-1762-2 varies with each opening of SCP-1762-1, with numbers ranging from fifty to over four hundred. 
 
After approximately two to three hours of time spent outside of SCP-1762-1, all instances of SCP-1762-2 return and fly back into SCP-1762-1; during this time, SCP-1762-1 will once again begin emitting smoke, and instances of SCP-1762-2 will vanish after passing the rim of SCP-1762-1. SCP-1762-1 closes once all SCP-1762-2 have returned to it; the next date of release is inconsistent. 
 
A message written or carved into a varying material will sometimes materialise on top of SCP-1762-1''s lid once the box retrieves all instances of SCP-1762-2. Attempts to send a message or recording device back with SCP-1762-2 have provided negative results. These documents and their appropriate dates of appearance are being compiled and recorded. 

Addendum 1762-01: On ██/██/20██, SCP-1762-1 began to undergo a series of events that lasted 11 months and 28 days; these events, as well as prior incidents that led up to the beginning of the scenario, have now been classified under the title "The Jabberwocky Event".', NULL, 1415, '_cc airborne artifact autonomous container document inscribed neutralized reptilian safe sapient scp sentient', 'https://scp-wiki.wikidot.com/scp-1762');

INSERT INTO scp_objects(code,title,obj_class,text,image_captions,rating,tags,link) VALUES ('SCP-4005','"The Holy and Heavenly City of Fabled China"','Apollyon', 'Special Containment Procedures 01/07/28: Containment of SCP-4005 is no longer possible. 
 
Description: SCP-4005 refers to an indestructible glass mosque lamp, recovered from Cairo, Egypt. Based on the testimony from a number of writers over the centuries, the lamp is believed to have been created in Marrakesh in the 14th century, travelling across Africa and Asia for several centuries before being brought to Cairo in the 1950s. 
 
When an individual stares for several seconds at SCP-4005 while it is lit, they will see images of urban scenes within the fire. These images possess a strong cognitohazardous effect, causing the viewer to become an SCP-4005-1 instance. 
 
SCP-4005-1 instances are characterised by an impetus to go on a pilgrimage to the city seen within SCP-4005''s fire. This involves travelling a great distance on foot, usually to another continent, and entering a specific portal; most often a door, cave entrance, or window. The location travelled to is almost always of some personal or spiritual importance to the SCP-4005-1 instance. Upon entering these portals, SCP-4005-1 instances will disappear. 
 
When interviewed by Foundation staff, SCP-4005-1 instances invariably believe that they will be taken to the city seen in SCP-4005 at the conclusion of their pilgrimage. They claim that all the urban scenes are of the same, single city, supposedly located somewhere within China or encompassing the entirety of China. These scenes have a great deal of variety, and although none are believed to correspond to any known location, they often bear a great deal of similarity to real-world cities. The prominence of this city in SCP-4005-1 instances'' narratives and the possibility of its existence based on common features found within them has lead to its provisional designation as SCP-4005-2. 
 
SCP-4005 was discovered in 1975, when it was removed from storage in a Cairo mosque and lit during a full congregation, which resulted in several hundred worshippers being converted into SCP-4005-1 instances. The resulting mass movement of people was noticed by the Foundation, who contained SCP-4005 and detained several hundred SCP-4005-1 instances after a full investigation.', NULL, 411, '_cc apollyon artifact cognitohazard glass historical indestructible light scp visual', 'https://scp-wiki.wikidot.com/scp-4005');
BEGIN;

-- Insérer des rôles
INSERT INTO "roles"("nom") VALUES 
  ('utilisateur'),
  ('admin')
ON CONFLICT ("nom") DO NOTHING;

-- Insérer des utilisateurs
INSERT INTO "utilisateurs" ("nom", "email", "mot_de_passe", "role_id")
VALUES 
  ('IbrahimAdmin', 'booknestapi@gmail.com', '$2b$10$fiL1h3Yze9AhvlMI3FRytOPpP6JL.wTC0LZ/KUT1f1CafyfJRDJ7y', 2),
  ('IbrahimUser ', 'imisbrahim.moha@gmail.com', '$2b$10$fiL1h3Yze9AhvlMI3FRytOPpP6JL.wTC0LZ/KUT1f1CafyfJRDJ7y', 1),
  ('UserInactif', 'userinactif@gmail.com', '$2b$10$fiL1h3Yze9AhvlMI3FRytOPpP6JL.wTC0LZ/KUT1f1CafyfJRDJ7y', 1 );

----- Insérer des logs RGPD de suppression
INSERT INTO "logs_rgpd_suppressions"("utilisateur_id", "nom", "email", "raison")
VALUES (3, 'UserInactif', 'userinactif@gmail.com', 'Inactivité supérieure à 1 an, conformément au RGPD');

-- Insérer des livres
INSERT INTO "livres" (
  "titre", "auteur", "description", "categorie",
  "disponible", "image_url", "stock", "extrait", "contenu"
) VALUES (
  'Le Petit Prince',
  'Antoine de Saint-Exupéry',
  'Conte poétique et philosophique, ce récit explore avec simplicité et profondeur les thèmes de l''amitié, de la perte, et de la sagesse enfantine.',
  'Roman',
  true,
  'https://i.imgur.com/vY12HDv.jpg',
  7,
  
  '<h2>À LÉON WERTH</h2>
  <p className="text-justify mb-4">Je demande pardon aux enfants d''avoir dédié ce livre à une grande personne. J''ai une excuse sérieuse : cette grande personne est le meilleur
  ami que j''ai au monde. J''ai une autre excuse : cette grande personne peut tout comprendre, même les livres pour enfants. 
  J''ai une troisième excuse : cette grande personne habite la France où elle a faim et froid. Elle a bien besoin d''être consolée. 
  Si toutes ces excuses ne suffisent pas, je veux bien dédier ce livre à l''enfant qu''a été autrefois cette grande personne. 
  Toutes les grandes personnes ont d''abord été des enfants. (Mais peu d''entre elles s''en souviennent.) Je corrige donc ma dédicace :</p><br />

  <h2>À LÉON WERTH</h2>
  <h2>QUAND IL ÉTAIT PETIT GARÇON</h2>'
  ,
  
  '<h2>PREMIER CHAPITRE</h2>
  <p className="text-justify mb-4">Lorsque j''avais six ans j''ai vu, une fois, une magnifique image, dans un livre sur la Forêt Vierge qui s''appelait « Histoires Vécues ». 
  Ça représentait un serpent boa qui avalait un fauve.</p><br />

  <p className="text-justify mb-4">On disait dans le livre : « Les serpents boas avalent leur proie tout entière, sans la mâcher. Ensuite ils ne peuvent plus bouger et ils 
  dorment pendant les six mois de leur digestion. »</p><br />

  <p className="text-justify mb-4">J''ai alors beaucoup réfléchi sur les aventures de la jungle et, à mon tour, j''ai réussi, avec un crayon de couleur, à tracer mon premier dessin. 
  Mon dessin numéro 1.</p><br />
  <p className="text-justify mb-4">J''ai montré mon chef-d''œuvre aux grandes personnes et je leur ai demandé si mon dessin leur faisait peur.</p><br />
  <p className="text-justify mb-4">Elles m''ont répondu: «Pourquoi un chapeau ferait-il peur ? »</p><br />

  <p className="text-justify mb-4">Mon dessin ne représentait pas un chapeau. Il représentait un serpent boa qui digérait un éléphant. J''ai alors dessiné l''intérieur du serpent boa, 
  afin que les grandes personnes puissent comprendre. Elles ont toujours besoin d''explications.</p><br />

  <p className="text-justify mb-4">Les grandes personnes m''ont conseillé de laisser de côté les dessins de serpents boas ouverts ou fermés, et de m''intéresser plutôt à la géographie, 
  à l''histoire, au calcul et à la grammaire. C''est ainsi que j''ai abandonné, à l''âge de six ans, une magnifique carrière de peintre. 
  J''avais été découragé par l''insuccès de mon dessin numéro 1 et de mon dessin numéro 2. Les grandes personnes ne comprennent jamais rien toutes seules, 
  et c''est fatigant, pour les enfants, de toujours et toujours leur donner des explications.</p><br />

  <p className="text-justify mb-4">J''ai donc dû choisir un autre métier et j''ai appris à piloter des avions. J''ai volé un peu partout dans le monde. Et la géographie, 
  C''est exact, m''a beaucoup servi. Je savais reconnaître,du premier coup d''œil, la Chine de l''Arizona. C''est très utile, si l''on est égaré pendant la nuit.</p><br />

  <p className="text-justify mb-4">J''ai ainsi eu, au cours de ma vie, des tas de contacts avec des tas de gens sérieux. J''ai beaucoup vécu chez les grandes personnes. 
  Je les ai vues de très près. Ça n''a pas trop amélioré mon opinion.</p><br />

  <p className="text-justify mb-4">Quand j''en rencontrais une qui me paraissait un peu lucide, je faisais l''expérience sur elle de mon dessin numéro 1 que j''ai toujours conservé. 
  Je voulais savoir si elle était vraiment compréhensive. Mais toujours elle me répondait : « C''est un chapeau. » Alors je ne lui parlais ni de serpents boas, 
  ni de forêts vierges, ni d''étoiles. Je me mettais à sa portée. Je lui parlais de bridge, de golf, 
  de politique et de cravates. Et la grande personne était bien contente de connaître un homme aussi raisonnable.</p><br />
  '
  ),

  ('L''Étranger', 

  'Albert Camus', 

  'Roman emblématique de l''absurde, il raconte l''histoire de Meursault, un homme détaché des normes sociales, confronté à l''absurdité de la vie et à la justice humaine.', 

  'Philosophie', 

  true, 

  'https://i.imgur.com/VvVb7ZD.jpg' , 

  7,

  '<h2>Partie I</h2>
  <p className="text-justify mb-4">Aujourd''hui, maman est morte. Ou peut-être hier, je ne sais pas. J''ai reçu un télégramme de l''asile : « Mère décédée. Enterrement demain. 
  Sentiments distingués. » Cela ne veut rien dire. C''était peut-être hier.</p><br />
  
  <p className="text-justify mb-4">L''asile de vieillards est à Marengo, à quatre-vingts kilomètres d''Alger. Je prendrai l''autobus à deux heures et j''arriverai dans l''après-midi. 
  Ainsi, je pourrai veiller et je rentrerai demain soir. 
  J''ai demandé deux jours de congé à mon patron et il ne pouvait pas me les refuser avec une excuse pareille. Mais il n''avait pas l''air content. 
  Je lui ai même dit : « Ce n''est pas de ma faute. » Il n''a pas répondu. 
  J''ai pensé alors que je n''aurais pas dû lui dire cela. En somme, je n''avais pas à m''excuser. C''était plutôt à lui de me présenter ses condoléances. 
  Mais il le fera sans doute après-demain, quand il me verra en deuil. 
  Pour le moment, c''est un peu comme si maman n''était pas morte. Après l''enterrement, au contraire, ce sera une affaire classée et tout 
  aura revêtu une allure plus officielle.</p><br />
  
  <p className="text-justify mb-4">J''ai pris l''autobus à deux heures. Il faisait très chaud. J''ai mangé au restaurant, chez Céleste, comme d''habitude. 
  Ils avaient tous beaucoup de peine pour moi et Céleste m''a dit : « On n''a qu''une mère. » 
  Quand je suis parti, ils m''ont accompagné à la porte. J''étais un peu étourdi parce qu''il a fallu que je monte chez Emmanuel 
  pour lui emprunter une cravate noire et un brassard. Il a perdu son oncle, il y a quelques mois.</p><br />
  
  <p className="text-justify mb-4">J''ai couru pour ne pas manquer le départ. Cette hâte, cette course, c''est à cause de tout cela sans doute, ajouté aux cahots, à</p><br />
  ',

  '<h2>CHAPITRE I</h2>
  <p className="text-justify mb-4">l''odeur d''essence, à la réverbération de la route et du ciel, que je me suis assoupi. J''ai dormi pendant presque tout le trajet. 
  Et quand je me suis réveillé, j''étais tassé contre un militaire qui m''a souri et qui m''a demandé si je venais de loin. J''ai dit « oui » 
  pour n''avoir plus à parler.</p><br />
  
  <p className="text-justify mb-4">L''asile est à deux kilomètres du village. J''ai fait le chemin à pied. J''ai voulu voir maman tout de suite. Mais le concierge m''a dit qu''il 
  fallait que je rencontre le directeur. Comme il était occupé, j''ai attendu un peu. Pendant tout ce temps, le concierge a parlé et ensuite, 
  j''ai vu le directeur : il m''a reçu dans son bureau. C''était un petit vieux, avec la Légion d''honneur. Il m''a regardé de ses yeux clairs. 
  Puis il m''a serré la main qu''il a gardée si long¬ temps que je ne savais trop comment la retirer. Il a consulté un dossier et m''a dit : 
  « M me Meursault est entrée ici il y a trois ans. Vous étiez son seul soutien. » J''ai cru qu''il me reprochait quelque chose et j''ai commencé à lui expliquer. 
  Mais il m''a in¬ terrompu : « Vous n''avez pas à vous justifier, mon cher enfant. J''ai lu le dossier de votre mère. Vous ne pouviez subvenir à ses besoins. 
  Il lui fallait une garde. Vos salaires sont modestes. Et tout compte fait, elle était plus heureuse ici. » J''ai dit : « Oui, monsieur le Directeur. » 
  Il a ajouté : « Vous savez, elle avait des amis, des gens de son âge. Elle pouvait partager avec eux des in¬ térêts qui sont d''un autre temps. 
  Vous êtes jeune et elle devait s''ennuyer avec vous. »</p><br />
  
  <p className="text-justify mb-4">C''était vrai. Quand elle était à la maison, maman passait son temps à me suivre des yeux en silence. Dans les premiers jours où elle était à 
  l''asile, elle pleurait souvent. Mais c''était à cause de l''habitude. Au bout de quelques mois, elle aurait pleuré si on l''avait retirée de l''asile. 
  Toujours à cause de l''habitude. C''est un peu pour cela que dans la dernière année je n''y suis presque plus allé. Et aussi parce que cela me prenait mon dimanche
  - sans compter l''effort pour aller à l''autobus, prendre des tickets et faire deux heures de route.</p><br />
  
  <p className="text-justify mb-4">Le directeur m''a encore parlé. Mais je ne l''écoutais presque plus. Puis il m''a dit : « Je suppose que vous voulez voir votre mère. » 
  Je me suis levé sans rien dire et il m''a précédé vers la porte. Dans l''escalier, il m''a expliqué : « Nous l''avons transportée dans notre petite morgue. 
  Pour ne pas impressionner les autres. Chaque fois qu''un pensionnaire meurt, les autres sont nerveux pendant deux ou trois jours. Et ça rend le service difficile.
  » Nous avons traversé une cour où il y avait beaucoup de vieillards, bavardant par petits groupes. Ils se taisaient quand nous passions. 
  Et derrière nous, les conversations reprenaient. On aurait dit d''un jacassement assourdi de perruches. À la porte d''un petit bâtiment, 
  le directeur m''a quitté : « Je vous laisse, monsieur Meursault. Je suis à votre disposition dans mon bu¬ reau. En principe, l''enterrement 
  est fixé à dix heures du matin. Nous avons pensé que vous pourrez ainsi veiller la disparue. Un dernier mot : votre mère a, paraît-il, 
  exprimé souvent à ses compagnons le désir d''être enterrée religieusement. J''ai pris sur moi de faire le nécessaire. Mais je voulais vous en informer. » 
  Je l''ai remercié. Maman, sans être athée, n''avait jamais pensé de son vivant à la religion.</p><br />
  
  <p className="text-justify mb-4">Je suis entré. C''était une salle très claire, blanchie à la chaux et recouverte d''une verrière. Elle était meublée de chaises et de chevalets en forme de X. 
  Deux d''entre eux, au centre, sup¬ portaient une bière recouverte de son couvercle. On voyait seu¬ lement des vis brillantes, à peine enfoncées, se détacher sur 
  les planches passées au brou de noix. Près de la bière, il y avait une infirmière arabe en sarrau blanc, un foulard de couleur vive sur la tête.</p><br />
  
  <p className="text-justify mb-4">À ce moment, le concierge est entré derrière mon dos. Il avait dû courir. Il a bégayé un peu : « On l''a couverte, mais je dois dévisser la bière pour que 
  vous puissiez la voir. » Il s''approchait de la bière quand je l''ai arrêté. Il m''a dit : « Vous ne voulez pas ? » J''ai répondu : « Non. » Il s''est interrompu 
  et j''étais gêné parce que je sentais que je n''aurais pas dû dire cela. Au bout d''un moment, il m''a regardé et il m''a demandé : « Pourquoi ? » mais sans 
  reproche, comme s''il s''informait. J''ai dit : « Je ne sais pas. » Alors, tortillant sa moustache blanche, il a déclaré sans me regarder : « Je comprends. » 
  Il avait de beaux yeux, bleu clair, et un teint un peu rouge. Il m''a donné une chaise et lui-même s''est assis un peu en arrière de moi. La garde s''est 
  levée et s''est dirigée vers la sortie. À ce moment, le con¬ cierge m''a dit : « C''est un chancre qu''elle a. » Comme je ne comprenais pas, j''ai regardé 
  l''infirmière et j''ai vu qu''elle portait sous les yeux un bandeau qui faisait le tour de la tête. À la hau¬ teur du nez, le bandeau était plat. 
  On ne voyait que la blancheur du bandeau dans son visage.</p><br />
  
  <p className="text-justify mb-4">Quand elle est partie, le concierge a parlé : « Je vais vous laisser seul. » Je ne sais pas quel geste j''ai fait, mais il est resté, debout derrière moi. 
  Cette présence dans mon dos me gênait. La pièce était pleine d''une belle lumière de fin d''après-midi. Deux frelons bourdonnaient contre la verrière. 
  Et je sentais le sommeil me gagner. J''ai dit au concierge, sans me retourner vers lui : « Il y a longtemps que vous êtes là ? » Immédiatement il a répondu : 
  « Cinq ans » - comme s''il avait attendu depuis toujours ma demande.</p><br />
  
  <p className="text-justify mb-4">Ensuite, il a beaucoup bavardé. On l''aurait bien étonné en lui disant qu''il finirait concierge à l''asile de Marengo. Il avait soixante-quatre ans et 
  il était Parisien. À ce moment je l''ai inter¬ rompu : « Ah ! vous n''êtes pas d''ici ? » Puis je me suis souvenu qu''avant de me conduire chez le directeur, 
  il m''avait parlé de maman. Il m''avait dit qu''il fallait l''enterrer très vite, parce que dans la plaine il faisait chaud, surtout dans ce pays. 
  C''est alors qu''il m''avait appris qu''il avait vécu à Paris et qu''il avait du mal à l''oublier. À Paris, on reste avec le mort trois, quatre jours 
  quelquefois. Ici on n''a pas le temps, on ne s''est pas fait à l''idée que déjà il faut courir derrière le corbillard. Sa femme lui avait dit alors : 
  « Tais-toi, ce ne sont pas des choses à raconter à mon¬ sieur. » Le vieux avait rougi et s''était excusé. J''étais intervenu pour dire : « Mais non. Mais non. » 
  Je trouvais ce qu''il racontait juste et intéressant.</p><br />
  
  <p className="text-justify mb-4">Dans la petite morgue, il m''a appris qu''il était entré à l''asile comme indigent. Comme il se sentait valide, il s''était proposé pour cette 
  place de concierge. Je lui ai fait remarquer qu''en somme il était un pensionnaire. Il m''a dit que non. J''avais déjà été frappé par la façon qu''il 
  avait de dire : « ils », « les autres », et plus rarement « les vieux », en parlant des pensionnaires dont certains n''étaient pas plus âgés que lui. 
  Mais naturellement, ce n''était pas la même chose. Lui était concierge, et, dans une certaine mesure, il avait des droits sur eux.</p><br />
  
  <p className="text-justify mb-4">La garde est entrée à ce moment. Le soir était tombé brus¬ quement. Très vite, la nuit s''était épaissie au-dessus de la ver¬ rière. Le concierge a 
  tourné le commutateur et j''ai été aveuglé par l''éclaboussement soudain de la lumière. Il m''a invité à me rendre au réfectoire pour dîner. 
  Mais je n''avais pas faim. Il m''a offert alors d''apporter une tasse de café au lait. Comme j''aime beaucoup le café au lait, j''ai accepté et 
  il est revenu un moment après avec un plateau. J''ai bu. J''ai eu alors envie de fumer. Mais j''ai hésité parce que je ne savais pas si je pouvais 
  le faire devant maman. J''ai réfléchi, cela n''avait aucune importance. J''ai offert une cigarette au concierge et nous avons fumé.</p><br />
  
  <p className="text-justify mb-4">À un moment, il m''a dit : « Vous savez, les amis de ma¬ dame votre mère vont venir la veiller aussi. C''est la coutume. Il faut que j''aille 
  chercher des chaises et du café noir. » Je lui ai demandé si on pouvait éteindre une des lampes. L''éclat de la lumière sur les murs blancs me fatiguait. 
  Il m''a dit que ce n''était pas possible. L''installation était ainsi faite : c''était tout ou rien. Je n''ai plus beaucoup fait attention à lui. 
  Il est sorti, est revenu, a disposé des chaises. Sur l''une d''elles, il a empilé des tasses au¬ tour d''une cafetière. Puis il s''est assis en face de moi, 
  de l''autre côté de maman. La garde était aussi au fond, le dos tourné. Je ne voyais pas ce qu''elle faisait. Mais au mouvement de ses bras, 
  je pouvais croire qu''elle tricotait. Il faisait doux, le café m''avait réchauffé et par la porte ouverte entrait une odeur de nuit et de fleurs. 
  Je crois que j''ai somnolé un peu.</p><br />
  
  <p className="text-justify mb-4">C''est un frôlement qui m''a réveillé. D''avoir fermé les yeux, la pièce m''a paru encore plus éclatante de blancheur. Devant moi, il n''y avait pas 
  une ombre et chaque objet, chaque angle, toutes les courbes se dessinaient avec une pureté blessante pour les yeux. C''est à ce moment que les amis de 
  maman sont entrés. Ils étaient en tout une dizaine, et ils glissaient en silence dans cette lumière aveuglante. Ils se sont assis sans qu''aucune chaise grinçât. 
  Je les voyais comme je n''ai jamais vu personne et pas un détail de leurs visages ou de leurs habits ne m''échappait. Pourtant je ne les entendais pas et 
  j''avais peine à croire à leur réalité. Presque toutes les femmes portaient un tablier et le cor¬ don qui les serrait à la taille faisait encore ressortir 
  leur ventre bombé. Je n''avais encore jamais remarqué à quel point les vieilles femmes pouvaient avoir du ventre. Les hommes étaient presque tous très 
  maigres et tenaient des cannes. Ce qui me frappait dans leurs visages, c''est que je ne voyais pas leurs yeux, mais seulement une lueur sans éclat 
  au milieu d''un nid de rides. Lorsqu''ils se sont assis, la plupart m''ont regardé et ont hoché la tête avec gêne, les lèvres toutes mangées par leur 
  bouche sans dents, sans que je puisse savoir s''ils me saluaient ou s''il s''agissait d''un tic. Je crois plutôt qu''ils me saluaient. C''est à ce moment 
  que je me suis aperçu qu''ils étaient tous assis en face de moi à dodeliner de la tête, autour du concierge. J''ai eu un moment l''impression ridicule 
  qu''ils étaient là pour méjuger.</p><br />
  
  <p className="text-justify mb-4">Peu après, une des femmes s''est mise à pleurer. Elle était au second rang, cachée par une de ses compagnes, et je la voyais mal. 
  Elle pleurait à petits cris, régulièrement : il me semblait qu''elle ne s''arrêterait jamais. Les autres avaient l''air de ne pas l''entendre. 
  Ils étaient affaissés, mornes et silencieux. Ils regar¬ daient la bière ou leur canne, ou n''importe quoi, mais ils ne re¬ gardaient que cela. 
  La femme pleurait toujours. J''étais très étonné parce que je ne la connaissais pas. J''aurais voulu ne plus l''entendre. Pourtant je n''osais pas le lui dire. 
  Le concierge s''est penché vers elle, lui a parlé, mais elle a secoué la tête, a bre¬ douillé quelque chose, et a continué de pleurer avec la même régularité. 
  Le concierge est venu alors de mon côté. Il s''est assis près de moi. Après un assez long moment, il m''a renseigné sans me regarder : 
  « Elle était très liée avec madame votre mère. Elle dit que c''était sa seule amie ici et que maintenant elle n''a plus personne. »</p><br />
  
  <p className="text-justify mb-4">Nous sommes restés un long moment ainsi. Les soupirs et les sanglots de la femme se faisaient plus rares. Elle reniflait beaucoup. Elle s''est tue enfin. 
  Je n''avais plus sommeil, mais j''étais fatigué et les reins me faisaient mal. À présent c''était le si¬ lence de tous ces gens qui m''était pénible. 
  De temps en temps seulement, j''entendais un bruit singulier et je ne pouvais com¬ prendre ce qu''il était. À la longue, j''ai fini par deviner que quelques-uns 
  d''entre les vieillards suçaient l''intérieur de leurs joues et laissaient échapper ces clappements bizarres. Ils ne s''en apercevaient pas tant ils étaient 
  absorbés dans leurs pensées. J''avais même l''impression que cette morte, couchée au milieu d''eux, ne signifiait rien à leurs yeux. 
  Mais je crois maintenant que c''était une impression fausse.</p><br />
  
  <p className="text-justify mb-4">Nous avons tous pris du café, servi par le concierge. En¬ suite, je ne sais plus. La nuit a passé. Je me souviens qu''à un moment j''ai ouvert les 
  yeux et j''ai vu que les vieillards dor¬ maient tassés sur eux-mêmes, à l''exception d''un seul qui, le menton sur le dos de ses mains agrippées à la canne, 
  me regar¬ dait fixement comme s''il n''attendait que mon réveil. Puis j''ai encore dormi. Je me suis réveillé parce que j''avais de plus en plus mal aux reins. 
  Le jour glissait sur la verrière. Peu après, l''un des vieillards s''est réveillé et il a beaucoup toussé. Il cra¬ chait dans un grand mouchoir à carreaux et 
  chacun de ses cra¬ chats était comme un arrachement. Il a réveillé les autres et le concierge a dit qu''ils devraient partir. Ils se sont levés. 
  Cette veille incommode leur avait fait des visages de cendre. En sortant, et à mon grand étonnement, ils m''ont tous serré la main comme si cette nuit où 
  nous n''avions pas échangé un mot avait accru notre intimité.</p><br />
  
  <p className="text-justify mb-4">J''étais fatigué. Le concierge m''a conduit chez lui et j''ai pu faire un peu de toilette. J''ai encore pris du café au lait qui était très bon. 
  Quand je suis sorti, le jour était complètement levé. Au-dessus des collines qui séparent Marengo de la mer, le ciel était plein de rougeurs. 
  Et le vent qui passait au-dessus d''elles apportait ici une odeur de sel. C''était une belle journée qui se préparait. Il y avait longtemps que j''étais 
  allé à la campagne et je sentais quel plaisir j''aurais pris à me promener s''il n''y avait pas eu maman.</p><br />
  
  <p className="text-justify mb-4">Mais j''ai attendu dans la cour, sous un platane. Je respirais l''odeur de la terre fraîche et je n''avais plus sommeil. J''ai pensé aux collègues du bureau. 
  À cette heure, ils se levaient pour aller au travail : pour moi c''était toujours l''heure la plus difficile. J''ai encore réfléchi un peu à ces choses, mais 
  j''ai été distrait par une cloche qui sonnait à l''intérieur des bâtiments. Il y a eu du re¬ mue-ménage derrière les fenêtres, puis tout s''est calmé. 
  Le soleil était monté un peu plus dans le ciel : il commençait à chauf¬ fer mes pieds. Le concierge a traversé la cour et m''a dit que le directeur me demandait. 
  Je suis allé dans son bureau. Il m''a fait signer un certain nombre de pièces. J''ai vu qu''il était habillé de noir avec un pantalon rayé. Il a pris le téléphone 
  en main et il m''a interpellé : « Les employés des pompes funèbres sont là de¬ puis un moment. Je vais leur demander de venir fermer la bière. Voulez-vous 
  auparavant voir votre mère une dernière fois ? » J''ai dit non. Il a ordonné dans le téléphone en baissant la voix : « Figeac, dites aux hommes qu''ils peuvent aller. »</p><br />
  
  <p className="text-justify mb-4">Ensuite il m''a dit qu''il assisterait à l''enterrement et je l''ai remercié. Il s''est assis derrière son bureau, il a croisé ses petites jambes. 
  Il m''a averti que moi et lui serions seuls, avec l''infirmière de service. En principe, les pensionnaires ne devaient pas assister aux enterrements. 
  Il les laissait seulement veiller : « C''est une question d''humanité », a-t-il remarqué. Mais en l''espèce, il avait accordé l''autorisation de suivre le convoi 
  à un vieil ami de maman : « Thomas Pérez. » Ici, le directeur a souri. Il m''a dit : « Vous comprenez, c''est un sentiment un peu puéril. Mais lui et votre mère 
  ne se quittaient guère. À l''asile, on les plaisantait, on disait à Pérez : « C''est votre fiancée. » Lui riait. Ça leur faisait plaisir. Et le fait est que la 
  mort de M me Meursault l''a beaucoup affecté. Je n''ai pas cru devoir lui re¬ fuser l''autorisation. Mais sur le conseil du médecin visiteur, je lui ai interdit 
  la veillée d''hier. »</p><br />
  
  <p className="text-justify mb-4">Nous sommes restés silencieux assez longtemps. Le directeur s''est levé et a regardé par la fenêtre de son bureau. À un moment, il a observé : 
  « Voilà déjà le curé de Marengo. Il est en avance. » Il m''a prévenu qu''il faudrait au moins trois quarts d''heure de marche pour aller à l''église 
  qui est au village même. Nous sommes descendus. Devant le bâtiment, il y avait le curé et deux enfants de chœur. L''un de ceux-ci tenait un encensoir et 
  le prêtre se baissait vers lui pour régler la longueur de la chaîne d''argent. Quand nous sommes arrivés, le prêtre s''est relevé. Il m''a appelé « mon fils » 
  et m''a dit quelques mots. Il est entré ; je l''ai suivi.</p><br />
  
  <p className="text-justify mb-4">J''ai vu d''un coup que les vis de la bière étaient enfoncées et qu''il y avait quatre hommes noirs dans la pièce. J''ai entendu en même temps le directeur 
  me dire que la voiture attendait sur la route et le prêtre commencer ses prières. À partir de ce mo¬ ment, tout est allé très vite. Les hommes se sont avancés 
  vers la bière avec un drap. Le prêtre, ses suivants, le directeur et moimême sommes sortis. Devant la porte, il y avait une dame que je ne connaissais pas : 
  « M. Meursault », a dit le directeur. Je n''ai pas entendu le nom de cette dame et j''ai compris seulement qu''elle était infirmière déléguée. Elle a incliné 
  sans un sourire son visage osseux et long. Puis nous nous sommes rangés pour laisser passer le corps. Nous avons suivi les porteurs et nous sommes sortis de l''asile. 
  Devant la porte, il y avait la voiture. Vernie, oblongue et brillante, elle faisait penser à un plumier. À côté d''elle, il y avait, l''ordonnateur, petit homme 
  aux habits ri¬ dicules, et un vieillard à l''allure empruntée. J''ai compris que c''était M. Pérez. Il avait un feutre mou à la calotte ronde et aux ailes larges 
  (il l''a ôté quand la bière a passé la porte), un cos¬ tume dont le pantalon tirebouchonnait sur les souliers et un nœud d''étoffe noire trop petit pour sa chemise 
  à grand col blanc. Ses lèvres tremblaient au-dessous d''un nez truffé de points noirs. Ses cheveux blancs assez fins laissaient passer de curieuses oreilles ballantes 
  et mal ourlées dont la couleur rouge sang dans ce visage blafard me frappa. L''ordonnateur nous donna nos places. Le curé marchait en avant, puis la voiture. 
  Autour d''elle, les quatre hommes. Derrière, le directeur, moimême et, fermant la marche, l''infirmière déléguée et M. Pérez.</p><br />
  
  <p className="text-justify mb-4">Le ciel était déjà plein de soleil. Il commençait à peser sur la terre et la chaleur augmentait rapidement. Je ne sais pas pourquoi nous avons attendu 
  assez longtemps avant de nous mettre en marche. J''avais chaud sous mes vêtements sombres. Le petit vieux, qui s''était recouvert, a de nouveau ôté son chapeau. 
  Je m''étais un peu tourné de son côté, et je le regardais lorsque le directeur m''a parlé de lui. Il m''a dit que souvent ma mère et M. Pérez allaient se promener 
  le soir jusqu''au village, accompagnés d''une infirmière. Je regardais la campagne autour de moi. À travers les lignes de cyprès qui menaient aux collines près du 
  ciel, cette terre rousse et verte, ces maisons rares et bien dessinées, je comprenais maman. Le soir, dans ce pays, devait être comme une trêve mélancolique. 
  Aujourd''hui, le soleil dé¬ bordant qui faisait tressaillir le paysage le rendait inhumain et déprimant.</p><br />
  
  <p className="text-justify mb-4">Nous nous sommes mis en marche. C''est à ce moment que je me suis aperçu que Pérez claudiquait légèrement. La voiture, peu à peu, prenait de la vitesse 
  et le vieillard perdait du terrain. L''un des hommes qui entouraient la voiture s''était laissé dépasser aussi et marchait maintenant à mon niveau. 
  J''étais surpris de la rapidité avec laquelle le soleil montait dans le ciel. Je me suis aperçu qu''il y avait déjà longtemps que la campagne bourdonnait du 
  chant des insectes et de crépitements d''herbe. La sueur coulait sur mes joues. Comme je n''avais pas de chapeau, je m''éventais avec mon mouchoir. 
  L''employé des pompes fu¬ nèbres m''a dit alors quelque chose que je n''ai pas entendu. En même temps, il s''essuyait le crâne avec un mouchoir qu''il tenait 
  dans sa main gauche, la main droite soulevant le bord de sa cas¬ quette. Je lui ai dit : « Comment ?» Il a répété en montrant le ciel : « Ça tape. » 
  J''ai dit : « Oui. » Un peu après, il m''a deman¬ dé : « C''est votre mère qui est là ? » J''ai encore dit : « Oui. » « Elle était vieille ? » J''ai répondu : 
  « Comme ça », parce que je ne savais pas le chiffre exact. Ensuite, il s''est tu. Je me suis re¬ tourné et j''ai vu le vieux Pérez à une cinquantaine de mètres 
  derrière nous. Il se hâtait en balançant son feutre à bout de bras. J''ai regardé aussi le directeur. Il marchait avec beaucoup de dignité, sans un geste inutile. 
  Quelques gouttes de sueur per¬ laient sur son front, mais il ne les essuyait pas.</p><br />
  
  <p className="text-justify mb-4">Il me semblait que le convoi marchait un peu plus vite. Au¬ tour de moi, c''était toujours la même campagne lumineuse gor¬ gée de soleil. 
  L''éclat du ciel était insoutenable. À un moment donné, nous sommes passés sur une partie de la route qui avait été récemment refaite. 
  Le soleil avait fait éclater le goudron. Les pieds y enfonçaient et laissaient ouverte sa pulpe brillante. Audessus de la voiture, le chapeau du cocher, 
  en cuir bouilli, sem¬ blait avoir été pétri dans cette boue noire. J''étais un peu perdu entre le ciel bleu et blanc et la monotonie de ces couleurs, 
  noir gluant du goudron ouvert, noir terne des habits, noir laqué de la voiture. Tout cela, le soleil, l''odeur de cuir et de crottin de la voiture, 
  celle du vernis et celle de l''encens, la fatigue d''une nuit d''insomnie, me troublait le regard et les idées. Je me suis re¬ tourné une fois de plus : 
  Pérez m''a paru très loin, perdu dans une nuée de chaleur, puis je ne l''ai plus aperçu. Je l''ai cherché du regard et j''ai vu qu''il avait quitté la route 
  et pris à travers champs. J''ai constaté aussi que devant moi la route tournait. J''ai compris que Pérez qui connaissait le pays coupait au plus court pour 
  nous rattraper. Au tournant il nous avait rejoints. Puis nous l''avons perdu. Il a repris encore à travers champs et comme cela plusieurs fois. Moi, 
  je sentais le sang qui me battait aux tempes.</p><br />
  
  <p className="text-justify mb-4">Tout s''est passé ensuite avec tant de précipitation, de certi¬ tude et de naturel, que je ne me souviens plus de rien. Une chose seulement : à 
  l''entrée du village, l''infirmière déléguée m''a parlé. Elle avait une voix singulière qui n''allait pas avec son vi¬ sage, une voix mélodieuse et tremblante. 
  Elle m''a dit : « Si on va doucement, on risque une insolation. Mais si on va trop vite, on est en transpiration et dans l''église on attrape un chaud et froid. » 
  Elle avait raison. Il n''y avait pas d''issue. J''ai encore gar¬ dé quelques images de cette journée : par exemple, le visage de Pérez quand, pour la dernière fois, 
  il nous a rejoints près du vil¬ lage. De grosses larmes d''énervement et de peine ruisselaient sur ses joues. Mais, à cause des rides, elles ne s''écoulaient pas. 
  Elles s''étalaient, se rejoignaient et formaient un vernis d''eau sur ce visage détruit. Il y a eu encore l''église et les villageois sur les trottoirs, les 
  géraniums rouges sur les tombes du cimetière, l''évanouissement de Pérez (on eût dit un pantin disloqué), la terre couleur de sang qui roulait sur la bière de maman, 
  la chair blanche des racines qui s''y mêlaient, encore du monde, des voix, le village, l''attente devant un café, l''incessant ronflement du moteur, et ma joie 
  quand l''autobus est entré dans le nid de lu¬ mières d''Alger et que j''ai pensé que j''allais me coucher et dor¬ mir pendant douze heures.</p><br />
  '
  ),


  ('La Peste', 

  'Albert Camus', 

  'Publié en 1947, La Peste est un roman allégorique racontant l''apparition d''une épidémie de peste bubonique dans la ville d''Oran, en Algérie.', 

  'Roman', 

  true, 

  'https://i.imgur.com/fS3odkh.jpg' , 

  7,

  
  '<h2>CHAPITRE I</h2>
  
  <p className="text-justify mb-4">Les curieux événements qui font le sujet de cette chronique se sont produits en 194., à Oran. De l''avis général, ils n''y étaient pas à leur place, 
  sortant un peu de l''ordinaire. À première vue, Oran est, en effet, une ville ordinaire et rien de plus qu''une préfecture française de la côte algérienne.</p><br />
  
  <p className="text-justify mb-4">La cité elle-même, on doit l''avouer, est laide. D''aspect tranquille, il faut quelque temps pour apercevoir ce qui la rend différente de tant d''autres 
  villes commerçantes, sous toutes les latitudes. Comment faire imaginer, par exemple, une ville sans pigeons, sans arbres et sans jardins, où l''on ne rencontre 
  ni battements d''ailes ni froissements de feuilles, un lieu neutre pour tout dire ? Le changement des saisons ne s''y lit que dans le ciel. Le printemps 
  s''annonce seulement par la qualité de l''air ou par les corbeilles de fleurs que des petits vendeurs ramènent des banlieues ; c''est un printemps qu''on vend 
  sur les marchés. Pendant l''été, le soleil incendie les maisons trop sèches et couvre les murs d''une cendre grise ; on ne peut plus vivre alors que dans 
  l''ombre des volets clos. En automne, c''est, au contraire, un déluge de boue. Les beaux jours viennent seulement en hiver. </p><br />
  
  <p className="text-justify mb-4">Une manière commode de faire la connaissance d''une ville est de chercher comment on y travaille, comment on y aime et comment on y meurt. 
  Dans notre petite ville, est-ce l''effet du climat, tout cela se fait ensemble, du même air frénétique et ab sent. C''est-à-dire qu''on s''y ennuie et 
  qu''on s''y applique à pren dre des habitudes. Nos concitoyens travaillent beaucoup, mais toujours pour s''enrichir. Ils s''intéressent surtout au commerce 
  et ils s''occupent d''abord, selon leur expression, de faire des af faires. Naturellement ils ont du goût aussi pour les joies simples, ils aiment les femmes, 
  le cinéma et les bains de mer. Mais, très raisonnablement, ils réservent ces plaisirs pour le samedi soir et le dimanche, essayant, les autres jours de la 
  se maine, de gagner beaucoup d''argent. Le soir, lorsqu''ils quittent leurs bureaux, ils se réunissent à heure fixe dans les cafés, ils se promènent sur 
  le même boulevard ou bien ils se mettent à leurs balcons. Les désirs des plus jeunes sont violents et brefs, tandis que les vices des plus âgés ne dépassent 
  pas les associations de boulomanes, les banquets des amicales et les cercles où l''on joue gros jeu sur le hasard des cartes.</p><br />
  ',
  
  '<h2>CHAPITRE I</h2>
  <p className="text-justify mb-4">On dira sans doute que cela n''est pas particulier à notre ville et qu''en somme tous nos contemporains sont ainsi. Sans doute, rien n''est plus naturel, 
  aujourd''hui, que de voir des gens travailler du matin au soir et choisir ensuite de perdre aux cartes, au café, et en bavardages, le temps qui leur reste 
  pour vivre. Mais il est des villes et des pays où les gens ont, de temps en temps, le soupçon d''autre chose. En général, cela ne change pas leur vie. 
  Seulement, il y a eu le soupçon et c''est toujours cela de gagné. Oran, au contraire, est apparemment une ville sans soupçons, c''est-à-dire une ville tout 
  à fait moderne. Il n''est pas nécessaire, en conséquence, de préciser la façon dont on s''aime chez nous. Les hommes et les femmes, ou bien se dévorent 
  rapidement dans ce qu''on appelle l''acte d''amour, ou bien s''engagent dans une longue habitude à deux. Entre ces ex trêmes, il n''y a pas souvent de milieu. 
  Cela non plus n''est pas original. À Oran comme ailleurs, faute de temps et de réflexion, on est bien obligé de s''aimer sans le savoir.</p><br />
  
  <p className="text-justify mb-4">Ce qui est plus original dans notre ville est la difficulté qu''on peut y trouver à mourir. Difficulté, d''ailleurs, n''est pas le bon mot et il serait 
  plus juste de parler d''inconfort. Ce n''est ja mais agréable d''être malade, mais il y a des villes et des pays qui vous soutiennent dans la maladie, où 
  l''on peut, en quelque sorte, se laisser aller. Un malade a besoin de douceur, il aime à s''appuyer sur quelque chose, c''est bien naturel. Mais à Oran, 
  les excès du climat, l''importance des affaires qu''on y traite, l''insignifiance du décor, la rapidité du crépuscule et la qualité des plaisirs, tout 
  demande la bonne santé. Un malade s''y trouve bien seul. Qu''on pense alors à celui qui va mourir, pris au piège derrière des centaines de murs crépitants 
  de chaleur, pendant qu''à la même minute, toute une population, au téléphone ou dans les cafés, parle de traites, de connaissements et d''escompte. 
  On comprendra ce qu''il peut y avoir d''inconfortable dans la mort, même moderne, lorsqu''elle survient ainsi dans un lieu sec.</p><br />
  
  <p className="text-justify mb-4">Ces quelques indications donnent peut-être une idée suffi sante de notre cité. Au demeurant, on ne doit rien exagérer. Ce qu''il fallait souligner, 
  c''est l''aspect banal de la ville et de la vie. Mais on passe ses journées sans difficultés aussitôt qu''on a des habitudes. Du moment que notre ville 
  favorise justement les habitudes, on peut dire que tout est pour le mieux. Sous cet angle, sans doute, la vie n''est pas très passionnante. Du moins, 
  on ne connaît pas chez nous le désordre. Et notre population franche, sympathique et active, a toujours provoqué chez le voyageur une estime raisonnable. 
  Cette cité sans pittoresque, sans végétation et sans âme finit par sembler reposante, on s''y endort enfin. Mais il est juste d''ajouter qu''elle s''est 
  greffée sur un paysage sans égal, au milieu d''un plateau nu, entouré de col lines lumineuses, devant une baie au dessin parfait. On peut seulement regretter 
  qu''elle se soit construite en tournant le dos à cette baie et que, partant, il soit impossible d''apercevoir la mer qu''il faut toujours aller chercher.</p><br />
  
  <p className="text-justify mb-4">Arrivé là, on admettra sans peine que rien ne pouvait faire espérer à nos concitoyens les incidents qui se produisirent au printemps de cette année-là 
  et qui furent, nous le comprîmes ensuite, comme les premiers signes de la série des graves événements dont on s''est proposé de faire ici la chronique. 
  Ces faits paraîtront bien naturels à certains et, à d''autres, invraisem blables au contraire. Mais, après tout, un chroniqueur ne peut tenir compte de ces 
  contradictions. Sa tâche est seulement de dire : « Ceci est arrivé », lorsqu''il sait que ceci est, en effet, arrivé, que ceci a intéressé la vie de tout un 
  peuple, et qu''il y a donc des milliers de témoins qui estimeront dans leur coeur la vérité de ce qu''il dit.</p><br />
  
  <p className="text-justify mb-4">Du reste, le narrateur, qu''on connaîtra toujours à temps, n''aurait guère de titre à faire valoir dans une entreprise de ce genre si le hasard ne 
  l''avait mis à même de recueillir un certain nombre de dépositions et si la force des choses ne l''avait mêlé à tout ce qu''il prétend relater. 
  C''est ce qui l''autorise à faire oeuvre d''historien. Bien entendu, un historien, même s''il est un ama teur, a toujours des documents. Le narrateur de cette 
  histoire a donc les siens : son témoignage d''abord, celui des autres en suite, puisque, par son rôle, il fut amené à recueillir les confi dences de tous les 
  personnages de cette chronique, et, en der nier lieu, les textes qui finirent par tomber entre ses mains. Il se propose d''y puiser quand il le jugera bon et 
  de les utiliser comme il lui plaira. Il se propose encore… Mais il est peut-être temps de laisser les commentaires et les précautions de langage pour en venir 
  au récit lui-même. La relation des premières journées demande quelque minutie.</p><br />
  
  <p className="text-justify mb-4">Le matin du 16 avril, le docteur Bernard Rieux sortit de son cabinet et buta sur un rat mort, au milieu du palier. Sur le mo ment, il écarta la bête sans y 
  prendre garde et descendit l''escalier. Mais, arrivé dans la rue, la pensée lui vint que ce rat n''était pas à sa place et il retourna sur ses pas pour avertir 
  le concierge. Devant la réaction du vieux M. Michel, il sentit mieux ce que sa découverte avait d''insolite. La présence de ce rat mort lui avait paru seulement 
  bizarre tandis que, pour le concierge, elle constituait un scandale. La position de ce dernier était d''ailleurs catégorique : il n''y avait pas de rats dans la 
  maison. Le docteur eut beau l''assurer qu''il y en avait un sur le palier du premier étage, et probablement mort, la conviction de M. Michel restait entière. 
  Il n''y avait pas de rats dans la maison, il fallait donc qu''on eût apporté celui-ci du dehors. Bref, il s''agissait d''une farce.</p><br />
  
  <p className="text-justify mb-4">Le soir même, Bernard Rieux, debout dans le couloir de l''immeuble, cherchait ses clefs avant de monter chez lui, lors qu''il vit surgir, du fond obscur du 
  corridor, un gros rat à la dé marche incertaine et au pelage mouillé. La bête s''arrêta, sembla chercher un équilibre, prit sa course vers le docteur, s''arrêta 
  en core, tourna sur elle-même avec un petit cri et tomba enfin en rejetant du sang par les babines entrouvertes. Le docteur la con templa un moment et remonta 
  chez lui.</p><br />
  
  <p className="text-justify mb-4">Ce n''était pas au rat qu''il pensait. Ce sang rejeté le ramenait à sa préoccupation. Sa femme, malade depuis un an, devait partir le lendemain pour une 
  station de montagne. Il la trouva couchée dans leur chambre, comme il lui avait demandé de le faire. Ainsi se préparait-elle à la fatigue du déplacement. 
  Elle souriait.</p><br />
  
  <p className="text-justify mb-4">Je me sens très bien, disait-elle.</p><br />
  
  <p className="text-justify mb-4">Le docteur regardait le visage tourné vers lui dans la lumière de la lampe de chevet. Pour Rieux, à 
  trente ans et malgré les marques de la maladie, ce visage était toujours celui de la jeunesse, à cause peut-être de ce 
  sourire qui emportait tout le reste. </p><br />
  
  <p className="text-justify mb-4">Dors si tu peux, dit-il. La garde viendra à onze heures et je vous mènerai au train de midi.</p><br />
  
  <p className="text-justify mb-4">Il embrassa un front légèrement moite. Le sourire l''accompagna jusqu''à la porte.</p><br />
  
  <p className="text-justify mb-4">Le lendemain 17 avril, à huit heures, le concierge arrêta le docteur au passage et accusa des mauvais plaisants d''avoir dé posé trois rats morts au milieu 
  du couloir. On avait dû les pren dre avec de gros pièges, car ils étaient pleins de sang. Le con cierge était resté quelque temps sur le pas de la porte, tenant 
  les rats par les pattes, et attendant que les coupables voulussent bien se trahir par quelque sarcasme. Mais rien n''était venu.</p><br />
  
  <p className="text-justify mb-4">Ah ! ceux-là, disait M. Michel, je finirai par les avoir.</p><br />
  
  <p className="text-justify mb-4">Intrigué, Rieux décida de commencer sa tournée par les quartiers extérieurs où habitaient les plus pauvres de ses clients. La collecte des ordures 
  s''y faisait beaucoup plus tard et l''auto qui roulait le long des voies droites et poussiéreuses de ce quar tier frôlait les boîtes de détritus, laissées au 
  bord du trottoir. Dans une rue qu''il longeait ainsi, le docteur compta une douzaine de rats jetés sur les débris de légumes et les chiffons sales.</p><br />
  
  <p className="text-justify mb-4">Il trouva son premier malade au lit, dans une pièce don nant sur la rue et qui servait à la fois de chambre à coucher et de salle à manger. C''était un vieil 
  Espagnol au visage dur et raviné. Il avait devant lui, sur la couverture, deux marmites remplies de pois. Au moment où le docteur entrait, le malade, à demi 
  dressé dans son lit, se renversait en arrière pour tenter de retrouver son souffle caillouteux de vieil asthmatique. Sa femme apporta une cuvette.</p><br />
  
  <p className="text-justify mb-4">Hein, docteur, dit-il pendant la piqûre, ils sortent, vous avez vu ? Oui, dit la femme, le voisin en a ramassé trois. Le vieux se frottait les mains. 
  – Ils sortent, on en voit dans toutes les poubelles, c''est la faim ! </p><br />
  
  <p className="text-justify mb-4">Rieux n''eut pas de peine à constater ensuite que tout le quartier parlait des rats. Ses visites terminées, il revint chez lui</p><br />
  
  <p className="text-justify mb-4">Il y a un télégramme pour vous là-haut, dit M. Michel. Le docteur lui demanda s''il avait vu de nouveaux rats.</p><br />
  
  <p className="text-justify mb-4">Ah ! non, dit le concierge, je fais le guet, vous comprenez. Et ces cochons-là n''osent pas.</p><br />
  
  <p className="text-justify mb-4">Le télégramme avertissait Rieux de l''arrivée de sa mère pour le lendemain. Elle venait s''occuper de la maison de son fils, en l''absence de la malade. 
  Quand le docteur entra chez lui, la garde était déjà là. Rieux vit sa femme debout, en tailleur, avec les couleurs du fard. Il lui sourit : – C''est bien, dit-il, 
  très bien. </p><br />
  '
  ),


  ('Candile', 

  'Voltaire', 

  'Satire mordante de l''optimisme de Leibniz, ce roman suit Candide à travers un monde rempli de malheurs, remettant en cause les idées de providence et de bonheur.', 

  'Philosophie', 

  true, 

  'https://i.imgur.com/fbsT6h4.jpg', 

  7,

  '<h2>CHAPITRE I</h2>
  <h2>Comment Candide fut élevé dans un beau château, et comment il fut chassé d''icelui.</h2>
  <p className="text-justify mb-4">Il y avait en Vestphalie, dans le château de monsieur le baron de Thunder-ten-tronckh, un jeune garçon à qui la nature avait donné les mœurs les plus douces. 
  Sa physionomie annonçait son âme. Il avait le jugement assez droit, avec l''esprit le plus simple; c''est, je crois, pour cette raison qu''on le nommait Candide. 
  Les anciens domestiques de la maison soupçonnaient qu''il était fils de la sœur de monsieur le baron, et d''un bon et honnête gentilhomme du voisinage, que cette 
  demoiselle ne voulut jamais épouser, parce qu''il n''avait pu prouver que soixante et onze quartiers, et que le reste de son arbre généalogique avait été perdu par 
  l''injure du temps.</p><br />
  
  <p className="text-justify mb-4">Monsieur le baron était un des plus puissants seigneurs de la Vestphalie, car son château avait une porte et des fenêtres. Sa grande salle même était ornée 
  d''une tapisserie. Tous les chiens de ses basses-cours composaient une meute dans le besoin; ses palefreniers étaient ses piqueurs; le vicaire du village était 
  son grand aumônier. Ils l''appelaient tous Monseigneur, et ils riaient quand il faisait des contes. Madame la baronne, qui pesait environ trois cent cinquante 
  livres, s''attirait par là une très grande considération, et faisait les honneurs de la maison avec une dignité qui la rendait encore plus respectable. 
  Sa fille Cunégonde âgée de dix-sept ans était haute en couleur, fraîche, grasse, appétissante. Le fils du baron paraissait en tout digne de son père.</p><br />
  
  <p className="text-justify mb-4">Le précepteur Pangloss était l''oracle de la maison, et le petit Candide écoutait ses leçons avec toute la bonne foi de son âge et de son caractère.</p><br />
  
  <p className="text-justify mb-4">Pangloss enseignait la métaphysico-théologocosmolonigologie. Il prouvait admirablement qu''il n''y a point d''effet sans cause, et que, dans ce meilleur des 
  mondes possibles, le château de monseigneur le baron était le plus beau des châteaux, et madame la meilleure des baronnes possibles.</p><br />
  ',
  
  '<h2>CHAPITRE I</h2>
  
  <p className="text-justify mb-4">Il est démontré, disait-il, que les choses ne peuvent être autrement : car tout étant fait pour une fin, tout est nécessairement pour la meilleure fin. 
  Remarquez bien que les nez ont été faits pour porter des lunettes, aussi avons-nous des lunettes. Les jambes sont visiblement instituées pour être chaussées, 
  et nous avons des chausses. Les pierres ont été formées pour être taillées, et pour en faire des châteaux; aussi monseigneur a un très beau château; 
  le plus grand baron de la province doit être le mieux logé: et les cochons étant faits pour être mangés, nous mangeons du porc toute l''année: par conséquent, 
  ceux qui ont avancé que tout est bien ont dit une sottise: il fallait dire que tout est au mieux.</p><br />
  
  <p className="text-justify mb-4">Candide écoutait attentivement, et croyait innocemment; car il trouvait mademoiselle Cunégonde extrêmement belle, quoiqu''il ne prît jamais la hardiesse de le lui dire.</p><br />
  
  <p className="text-justify mb-4">Il concluait qu''après le bonheur d''être né baron de Thunder-ten-tronckh, le second degré de bonheur était d''être mademoiselle Cunégonde, le troisième, 
  de la voir tous les jours, et le quatrième, d''entendre maître Pangloss, le plus grand philosophe de la province, et par conséquent de toute la terre.</p><br />
  
  <p className="text-justify mb-4">Un jour Cunégonde en se promenant auprès du château, dans le petit bois qu''on appelait parc, vit entre des broussailles le docteur Pangloss qui donnait 
  une leçon de physique expérimentale à la femme de chambre de sa mère, petite brune très jolie et très docile. Comme mademoiselle Cunégonde avait beaucoup de 
  dispositions pour les sciences, elle observa, sans souffler, les expériences réitérées dont elle fut témoin; elle vit clairement la raison suffisante du docteur, 
  les effets et les causes; et s''en retourna tout agitée, toute pensive, toute remplie du désir d''être savante; songeant qu''elle pourrait bien être la raison 
  suffisante du jeune Candide, qui pouvait aussi être la sienne.</p><br />
  
  <p className="text-justify mb-4">Elle rencontra Candide en revenant au château, et rougit; Candide rougit aussi; elle lui dit bonjour d''une voix entrecoupée, et Candide lui parla sans 
  savoir ce qu''il disait. Le lendemain après le dîner, comme on sortait de table, Cunégonde et Candide se trouvèrent derrière un paravent; Cunégonde laissa 
  tomber son mouchoir, Candide le ramassa, elle lui prit innocemment la main, le jeune homme baisa innocemment la main de la jeune demoiselle avec une vivacité, 
  une sensibilité, une grâce toute particulière; leurs bouches se rencontrèrent, leurs yeux s''enflammèrent, leurs genoux tremblèrent, leurs mains s''égarèrent. 
  Monsieur le baron de Thunderten-tronckh passa auprès du paravent, et voyant cette cause et cet effet, chassa Candide du château à grands coups de pied dans le 
  derrière; Cunégonde s''évanouit; elle fut souffletée par madame la baronne dès qu''elle fut revenue à elle-même; et tout fut consterné dans le plus beau et le 
  plus agréable des châteaux possibles.</p><br />
  '
  ),


  ('Les Fleurs du mal', 

  'Charles Baudelaire', 

  'Recueil de poésie majeur du XIXe siècle, explorant la beauté, la mélancolie, la modernité et le spleen à travers des vers puissants et novateurs.', 

  'Poésie', 

  true, 

  'https://i.imgur.com/SySoU3H.jpg', 

  7, 

  '<h2>AU LECTEUR</h2>
  
  <p className="text-justify mb-4">La sottise , l''erreur, le péché , la lésine Occupent nos esprits et travaillent nos corps , Et nous alimentons nos aimables remords , Gomme les 
  mendiants nourrissent leur vermine.</p><br />
  
  <p className="text-justify mb-4">Nos péchés sont têtus , nos repentirs sont lâches ; Nous nous faisons payer grassement nos aveux , Et nous rentrons gaîment dans le chemin bourbeux , 
  Croyant par de vils pleurs laver toutes nos taches.</p><br />
  
  <p className="text-justify mb-4">Sur l''oreiller du mal c''est Satan Trismégiste Qui berce longuement notre esprit enchanté , Et le riche métal de notre volonté Est tout vaporisé par ce 
  savant chimiste.</p><br />
  
  <p className="text-justify mb-4">C''est le Diable qui tient les fils qui nous remuent ! Aux objets répugnants nous trouvons des appas ; Chaque jûur vers l''Enfer nous descendons d''un pas, 
  Sans horreur, à travers des ténèbres qui puent.</p><br />
  
  <p className="text-justify mb-4">Ainsi qu''un débauché pauvre qui baise et mange Le sein martyrisé d''une antique catin ,Nous voulons au passage un plaisir clandestin Que nous pressons bien 
  fort comme une vieille orange</p><br />
  
  <p className="text-justify mb-4">Dans nos cerveaux malsains, comme un million d''helminthes, Grouille , chante et ripaille un peuple de Démons , Et, quand nous respirons , la Mort dans nos 
  poumons S''engouffre, comme un fleuve, avec de sourdes plaintes.</p><br />
  
  <p className="text-justify mb-4">Si le viol , le poison , le poignard , l''incendie N''ont pas encor brodé de leurs plaisants dessins Le canevas banal de nos piteux destins, 
  C''est que notre âme , hélas ! n''est pas assez hardie.</p><br />
  
  <p className="text-justify mb-4">Mais parmi les chacals, les panthères, les lyces, Les singes, les scorpions, les vautours, les serpents, I.es monstres glapissants, hurlants, grognants, 
  rampants, Dans la ménagerie infâme de nos vices</p><br />
  
  <p className="text-justify mb-4">Il en est un plus laid, plus méchant, plus immonde! Quoiqu''il ne fasse ni grands gestes ni grands cris, Il ferait volontiers de la terre un débris Et 
  dans un bâillement avalerait le monde ;</p><br />
  
  <p className="text-justify mb-4">C''est l''Ennui! — l''œil chargé d''un pleur involontaire,n rôve d''échafauds en fumant son houka. Tu le connais, lecteur, ce monstre délicat,</p><br />
  <ul>
    <li>Hypocrite lecteur,</li>
    <li>Mon semblable,</li>
    <li> mon frère!</li>
  </ul>
  ',
  
  '<h1>CHAPITRE I</h2>
  <h2>BENDICTION</h2>
  
  <p className="text-justify mb-4">Lorsque, par un décret des puissances suprêmes, Le Poète apparaît en ce monde ennuyé , Sa mère épouvantée et pleine de blasphèmes Crispe ses poings vers 
  Dieu qui la prend en pitié :</p><br />
  
  <p className="text-justify mb-4">« Ah ! que n''ai-je mis bas tout un nœud ae vipères , Plutôt que de nourrir cette dérision ! Maudite soit la nuit aux plaisirs éphémères Où mon ventre a 
  conçu mon expiation 1</p><br />
  
  <p className="text-justify mb-4">Puisque tu m''as choisie entre toutes les femmes Pour être le dégoût de mon triste mari , Et que je ne puis pas rejeter dans les flammes , Comme un billet 
  d''amour, ce monstre rabougri .</p><br />
  
  <p className="text-justify mb-4">Je ferai rejaillir ta haine qui m''accable Sur l''instrument maudit de tes méchancetés , Et je tordrai si bien cet arbre misérable Qu''il ne pourra pousser 
  ses boutons empestés ! »</p><br />
  
  <p className="text-justify mb-4">Elle ravale ainsi l''écume de sa haine, Et , ne comprenant pas les desseins éternels , Elle-même prépare au fond de la Géhenne Les bûchers consacrés aux 
  crimes maternels.</p><br />
  
  <p className="text-justify mb-4">Pourtant, sous la tutelle invisible d''un Ange, L''Enfant déshérité s''enivre de soleil , Et dans tout ce qu''il boit et dans tout ce qu''il mange Retrouve 
  l''ambroisie et le nectar vermeil.</p><br />
  
  <p className="text-justify mb-4">Il joue avec le vent , cause avec le nuage , Et s''enivre en chantant du chemin de la croix, Et l''Esprit qui le suit dans son pèlerinage Pleure de le voir 
  gai comme un oiseau des bois.</p><br />
  
  <p className="text-justify mb-4">Tous ceux qu''il veut aimer l''observent avec crainte, Ou bien, s''enhardissent de sa tranquiUité, Cherchent à qui saura lui tirer une plainte , Et font 
  sur lui l''essai de leur férocité.</p><br />
  
  <p className="text-justify mb-4">Dans le pain et le vin destinés à sa bouche Ils mêlent de la cendre avec d''impurs crachats ; Avec hypocrisie ils jettent ce qu''il touche , Et s''accusent 
  d''avoir mis leurs pieds dans ses pas.</p><br />
  
  <p className="text-justify mb-4">Sa femme va criant sur les places publicpies : « Puisqu''il me trouve belle et qu''il veut m''adorer. Je ferai le métier des idoles antiques , Que souvent 
  il fallait repeindre et redorer ;</p><br />
  
  <p className="text-justify mb-4">Et je veux me soûler de nard , d''encens, de myrrhe , De génuflexions, de viandes et de vins , Pour savoir si je puis dans un cœur qui m''admire Usurper en 
  riant les hommages divins !</p><br />
  
  <p className="text-justify mb-4">Et quand je m''ennuierai de ces farces impies. Je poserai sur lui ma frêle et forte main ; Et mes ongles , pareils aux ongles des harpies , Sauront jusqu''à 
  son cœur se frayer un chemin.</p><br />
  
  <p className="text-justify mb-4">Comme un tout jeune oiseau qui tremble et qui palpite, J''arracherai ce cœur tout rouge de son sein, Et, pour rassasier ma bête favorite , Je le lui jeterai 
  par terre avec dédain ! »</p><br />
  
  <p className="text-justify mb-4">Vers le Ciel , où son œil voit un trône splendide , Le Poète serein lève ses bras pieux , Et les vastes éclairs de son esprit lucide Lui dérobent l''aspect 
  des peuples furieux ;</p><br />
  
  <p className="text-justify mb-4">Soyez béni , mon Dieu , qui donnez la souffrance r^mme un divin remède à nos impuretés , Et comme la meilleure et la plus pure essence Qui prépare les forts 
  aux saintes voluptés !</p><br />
  
  <p className="text-justify mb-4">Je sais que vous gardez une place au Poète Dans les rangs bienheureux des saintes Légions, Et que vous l''invitez à l''éternelle fête Des Trônes , des Vertus , 
  des Dominations.</p><br />
  
  <p className="text-justify mb-4">Je sais que la douleur est la noblesse unique Où ne mordront jamais la terre et les enfers , Et qu''il faut pour tresser ma couronne mystique Imposer tous 
  les temps et tous les univers.</p><br />
  
  <p className="text-justify mb-4">Mais les bijoux perdus de l''antique Palmyre, I„es métaux inconnus, les perles de la mer. Montés par votre main , ne pourraient pas suffire A ce beau diadème 
  éblouissant et clair ;</p><br />
  
  <p className="text-justify mb-4">Car il ne sera fait que de pure lumière ,Puisée au foyer saint des rayons primitifs , Et dont les yeux mortels , dans leur splendeur entière ,Ne sont que 
  des miroirs obscurcis et plaintifs 1 »</p><br />
  '
  ),



  ('Germinal', 

  'Emile Zola', 

  'Roman naturaliste engagé, il décrit la vie difficile des mineurs dans le nord de la France au XIXe siècle et leur révolte contre l''injustice sociale.', 

  'Roman Social', 

  true, 

  'https://i.imgur.com/tWzveBU.jpg', 
  
  7,

  '<h2>GERMINAL</h2>
  <h2>CHAPITRE I</h2>
  
  <p className="text-justify mb-4">Dans la plaine rase, sous la nuit sans étoiles, d''une obscurité et d''une épaisseur d''encre, un homme suivait seul la grande route de Marchiennes à Montsou, 
  dix kilomètres de pavé coupant tout droit, à travers les champs de betteraves. Devant lui, il ne voyait même pas le sol noir, et il n''avait la sensation de 
  l''immense horizon plat que par les souffles du vent de mars, des rafales larges comme sur une mer, glacées d''avoir balayé des lieues de marais et de terres nues. 
  Aucune ombre d''arbre ne tachait le ciel, le pavé se déroulait avec la rectitude d''une jetée, au milieu de l''embrun aveuglant des ténèbres.</p><br />
  
  <p className="text-justify mb-4">L''homme était parti de Marchiennes vers deux heures. Il marchait d''un pas allongé, grelottant sous le coton aminci de sa veste et de son pantalon de velours. 
  Un petit paquet, noué dans un mouchoir à carreaux, le gênait beaucoup ; et il le serrait contre ses flancs, tantôt d''un coude, tantôt de l''autre, pour glisser au 
  fond de ses poches les deux mains à la fois, des mains gourdes que les lanières du vent d''est faisaient saigner. Une seule idée occupait sa tête vide d''ouvrier 
  sans travail et sans gîte, l''espoir que le froid serait moins vif après le lever du jour. Depuis une heure, il avançait ainsi, lorsque sur la gauche, à deux 
  kilomètres de Montsou, il aperçut des feux rouges, trois brasiers brûlant au plein air, et comme suspendus. D''abord, il hésita, pris de crainte ; puis, il ne put 
  résister au besoin douloureux de se chauffer un instant les mains.</p><br />
  
  <p className="text-justify mb-4">Un chemin creux s''enfonçait. Tout disparut. L''homme avait à droite une palissade, quelque mur de grosses planches fermant une voie ferrée ; tandis qu''un 
  talus d''herbe s''élevait à gauche, surmonté de pignons confus, d''une vision de village aux toitures basses et uniformes. Il fit environ deux cents pas. 
  Brusquement, à un coude du chemin, les feux reparurent près de lui, sans qu''il comprît davantage comment ils brûlaient si haut dans le ciel mort, pareils à des 
  lunes fumeuses. Mais, au ras du sol, un autre spectacle venait de l''arrêter. C''était une masse lourde, un tas écrasé de constructions, d''où se dressait la 
  silhouette d''une cheminée d''usine ; de rares lueurs sortaient des fenêtres encrassées, cinq ou six lanternes tristes étaient pendues dehors, à des charpentes 
  dont les bois noircis alignaient vaguement des profils de tréteaux gigantesques ; et, de cette apparition fantastique, noyée de nuit et de fumée, une seule voix 
  montait, la respiration grosse et longue d''un échappement de vapeur, qu''on ne voyait point.</p><br />
  
  <p className="text-justify mb-4">Alors, l''homme reconnut une fosse. Il fut repris de honte : à quoi bon ? il n''y aurait pas de travail. Au lieu de se diriger vers les bâtiments, il se 
  risqua enfin à gravir le terri, sur lequel brûlaient les trois feux de houille, dans des corbeilles de fonte, pour éclairer et réchauffer la besogne. 
  Les ouvriers de la coupe à terre avaient dû travailler tard, on sortait encore les déblais inutiles. Maintenant, il entendait les moulineurs pousser les 
  trains sur les tréteaux, il distinguait des ombres vivantes culbutant les berlines, près de chaque feu.</p><br />
  ',
  
  '<h2>CHAPITRE I</h2>
  
  <p className="text-justify mb-4">Bonjour, dit-il en s''approchant d''une des corbeilles.</p><br />
  
  <p className="text-justify mb-4">Tournant le dos au brasier, le charretier était debout, un vieillard vêtu d''un tricot de laine violette, coiffé d''une casquette en poil de lapin ; 
  pendant que son cheval, un gros cheval jaune, attendait, dans une immobilité de pierre, qu''on eût vidé les six berlines montées par lui. 
  Le manœuvre employé au culbuteur, un gaillard roux et efflanqué, ne se pressait guère, pesait sur le levier d''une main endormie. Et, là-haut, le vent 
  redoublait, une bise glaciale, dont les grandes haleines régulières passaient comme des coups de faux.</p><br />
  
  <p className="text-justify mb-4">Bonjour, répondit le vieux.</p><br />
  
  <p className="text-justify mb-4">Un silence se fit. L''homme, qui se sentait regardé d''un œil méfiant, dit son nom tout de suite.</p><br />
  
  <p className="text-justify mb-4">Je me nomme Étienne Lantier, je suis machineur… Il n''y a pas de travail ici ?</p><br />
  
  <p className="text-justify mb-4">Les flammes l''éclairaient, il devait avoir vingt et un ans, très brun, joli homme, l''air fort malgré ses membres menus.</p><br />
  
  <p className="text-justify mb-4">Rassuré, le charretier hochait la tête.</p><br />
  
  <ul><li>Du travail pour un machineur, non, non… Il s''en est encore présenté deux hier. Il n''y a rien.</li></ul>
  
  <p className="text-justify mb-4">Une rafale leur coupa la parole. Puis, Étienne demanda, en montrant le tas sombre des constructions, au pied du terri :</p><br />
  
  <p className="text-justify mb-4"> — C''est une fosse, n''est-ce pas ?</p><br />
  
  <p className="text-justify mb-4">Le vieux, cette fois, ne put répondre. Un violent accès de toux l''étranglait. Enfin, il cracha, et son crachat, sur le sol empourpré, 
  laissa une tache noire.— Oui, une fosse, le Voreux… Tenez ! le coron est tout près.</p><br />
  
  <p className="text-justify mb-4">À son tour, de son bras tendu, il désignait dans la nuit le village dont le jeune homme avait deviné les toitures. Mais les six berlines étaient vides, 
  il les suivit sans un claquement de fouet, les jambes raidies par des rhumatismes ; tandis que le gros cheval jaune repartait tout seul, tirait pesamment 
  entre les rails, sous une nouvelle bourrasque, qui lui hérissait le poil.</p><br />
  
  <p className="text-justify mb-4">Le Voreux, à présent, sortait du rêve. Étienne, qui s''oubliait devant le brasier à chauffer ses pauvres mains saignantes, regardait, retrouvait chaque 
  partie de la fosse, le hangar goudronné du criblage, le beffroi du puits, la vaste chambre de la machine d''extraction, la tourelle carrée de la pompe d''épuisement. 
  Cette fosse, tassée au fond d''un creux, avec ses constructions trapues de briques, dressant sa cheminée comme une corne menaçante, lui semblait avoir un air mauvais 
  de bête goulue, accroupie là pour manger le monde. Tout en l''examinant, il songeait à lui, à son existence de vagabond, depuis huit jours qu''il cherchait une 
  place ; il se revoyait dans son atelier du chemin de fer, giflant son chef, chassé de Lille, chassé de partout ; le samedi, il était arrivé à Marchiennes, où l''on 
  disait qu''il y avait du travail, aux Forges ; et rien, ni aux Forges, ni chez Sonneville, il avait dû passer le dimanche caché sous les bois d''un chantier de 
  charronnage, dont le surveillant venait de l''expulser, à deux heures de la nuit. Rien, plus un sou, pas même une croûte : qu''allait-il faire ainsi par les chemins, 
  sans but, ne sachant seulement où s''abriter contre la bise ? Oui, c''était bien une fosse, les rares lanternes éclairaient le carreau, une porte brusquement ouverte 
  lui avait permis d''entrevoir les foyers des générateurs, dans une clarté vive. Il s''expliquait jusqu''à l''échappement de la pompe, cette respiration grosse et 
  longue, soufflant sans relâche, qui était comme l''haleine engorgée du monstre.</p><br />
  
  <p className="text-justify mb-4">Le manœuvre du culbuteur, gonflant le dos, n''avait pas même levé les yeux sur Étienne, et celui-ci allait ramasser son petit paquet tombé à terre, lorsqu''un 
  accès de toux annonça le retour du charretier. Lentement, on le vit sortir de l''ombre, suivi du cheval jaune, qui montait six nouvelles berlines pleines.</p><br />
  
  <p className="text-justify mb-4">Il y a des fabriques à Montsou ? demanda le jeune homme. Le vieux cracha noir, puis répondit dans le vent :</p><br />
  
  <p className="text-justify mb-4">Oh ! ce ne sont pas les fabriques qui manquent. Fallait voir ça, il y a trois ou quatre ans ! Tout ronflait, on ne pouvait trouver des hommes, jamais on 
  n''avait tant gagné… Et voilà qu''on se remet à se serrer le ventre. Une vraie pitié dans le pays, on renvoie le monde, les ateliers ferment les uns après les 
  autres… Ce n''est peut-être pas la faute de l''empereur ; mais pourquoi va-t-il se battre en Amérique ? Sans compter que les bêtes meurent du choléra, comme les gens.</p><br />
  
  <p className="text-justify mb-4">Alors, en courtes phrases, l''haleine coupée, tous deux continuèrent à se plaindre. Étienne racontait ses courses inutiles depuis une semaine : il 
  fallait donc crever de faim ? bientôt les routes seraient pleines de mendiants. Oui, disait le vieillard, ça finirait par mal tourner, car il n''était 
  pas Dieu permis de jeter tant de chrétiens à la rue.</p><br />
  <ul>
    <li> On n''a pas de la viande tous les jours.</li>
    <li>Encore si l''on avait du pain !</li>
    <li>C''est vrai, si l''on avait du pain seulement !</li>
  </ul>
  
  <p className="text-justify mb-4">Leurs voix se perdaient, des bourrasques emportaient les mots dans un hurlement mélancolique.</p><br />
  
  <p className="text-justify mb-4">Tenez ! reprit très haut le charretier en se tournant vers le midi, Montsou est là…</p><br />
  
  <p className="text-justify mb-4">Et, de sa main tendue de nouveau, il désigna dans les ténèbres des points invisibles, à mesure qu''il les nommait. Là-bas, à Montsou, la sucrerie 
  Fauvelle marchait encore, mais la sucrerie Hoton venait de réduire son personnel ; il n''y avait guère que la minoterie Dutilleul et la corderie Bleuze pour 
  les câbles de mine, qui tinssent le coup. Puis, d''un geste large, il indiqua, au nord, toute une moitié de l''horizon : les ateliers de construction Sonneville 
  n''avaient pas reçu les deux tiers de leurs commandes habituelles ; sur les trois hauts fourneaux des Forges de Marchiennes, deux seulement étaient allumés ; enfin, 
  à la verrerie Gagebois, une grève menaçait, car on parlait d''une réduction de salaire.</p><br />
  
  <p className="text-justify mb-4">Je sais, je sais, répétait le jeune homme à chaque indication. J''en viens.</p><br />

  <p className="text-justify mb-4">Nous autres, ça va jusqu''à présent, ajouta le charretier. Les fosses ont pourtant diminué leur extraction. Et regardez, en face, à la Victoire, il n''y a 
  aussi que deux batteries de fours à coke qui flambent.</p><br />
  
  <p className="text-justify mb-4">Il cracha, il repartit derrière son cheval somnolent, après l''avoir attelé aux berlines vides.</p><br />
  
  <p className="text-justify mb-4">Maintenant, Étienne dominait le pays entier. Les ténèbres demeuraient profondes, mais la main du vieillard les avait comme emplies de grandes misères, que 
  le jeune homme, inconsciemment, sentait à cette heure autour de lui, partout, dans l''étendue sans bornes. N''était-ce pas un cri de famine que roulait le vent 
  de mars, au travers de cette campagne nue ? Les rafales s''étaient enragées, elles semblaient apporter la mort du travail, une disette qui tuerait beaucoup d''hommes. 
  Et, les yeux errants, il s''efforçait de percer les ombres, tourmenté du désir et de la peur de voir. Tout s''anéantissait au fond de l''inconnu des nuits obscures, 
  il n''apercevait, très loin, que les hauts fourneaux et les fours à coke. Ceux-ci, des batteries de cent cheminées, plantées obliquement, alignaient des rampes de 
  flammes rouges ; tandis que les deux tours, plus à gauche, brûlaient toutes bleues en plein ciel, comme des torches géantes. C''était d''une tristesse d''incendie, 
  il n''y avait d''autres levers d''astres, à l''horizon menaçant, que ces feux nocturnes des pays de la houille et du fer.</p><br />
  
  <p className="text-justify mb-4">Vous êtes peut-être de la Belgique ? reprit derrière Étienne le charretier, qui était revenu.</p><br />
  
  <p className="text-justify mb-4">Cette fois, il n''amenait que trois berlines. On pouvait toujours culbuter celles-là : un accident arrivé à la cage d''extraction, un écrou cassé, 
  allait arrêter le travail pendant un grand quart d''heure. En bas du terri, un silence s''était fait, les moulineurs n''ébranlaient plus les tréteaux d''un 
  roulement prolongé. On entendait seulement sortir de la fosse le bruit lointain d''un marteau, tapant sur de la tôle.</p><br />
  
  <p className="text-justify mb-4">Non, je suis du Midi, répondit le jeune homme</p><br />
  
  <p className="text-justify mb-4">Le manœuvre, après avoir vidé les berlines, s''était assis à terre, heureux de l''accident ; et il gardait sa sauvagerie muette, il avait simplement levé de 
  gros yeux éteints sur le charretier, comme gêné par tant de paroles. Ce dernier, en effet, n''en disait pas si long d''habitude. Il fallait que le visage de 
  l''inconnu lui convînt et qu''il fût pris d''une de ces démangeaisons de confidences, qui font parfois causer les vieilles gens tout seuls, à haute voix.</p><br />
  
  <p className="text-justify mb-4"> Moi, dit-il, je suis de Montsou, je m''appelle Bonnemort.</p><br />
  
  <p className="text-justify mb-4">C''est un surnom ? demanda Étienne étonné.</p><br />
  
  <p className="text-justify mb-4">Le vieux eut un ricanement d''aise, et montrant le Voreux :</p><br />
  
  <p className="text-justify mb-4">Oui, oui… On m''a retiré trois fois de là-dedans en morceaux, une fois avec tout le poil roussi, une autre avec de la terre jusque dans le gésier, 
  la troisième avec le ventre gonflé d''eau comme une grenouille… Alors, quand ils ont vu que je ne voulais pas crever, ils m''ont appelé Bonnemort, pour rire.</p><br />
  
  <p className="text-justify mb-4">Sa gaieté redoubla, un grincement de poulie mal graissée, qui finit par dégénérer en un accès terrible de toux. La corbeille de feu, maintenant, 
  éclairait en plein sa grosse tête, aux cheveux blancs et rares, à la face plate, d''une pâleur livide, maculée de taches bleuâtres. Il était petit, 
  le cou énorme, les mollets et les talons en dehors, avec de longs bras dont les mains carrées tombaient à ses genoux. Du reste, comme son cheval qui 
  demeurait immobile sur les pieds, sans paraître souffrir du vent, il semblait en pierre, il n''avait l''air de se douter ni du froid ni des bourrasques 
  sifflant à ses oreilles. Quand il eut toussé, la gorge arrachée par un raclement profond, il cracha au pied de la corbeille, et la terre noircit.</p><br />
  
  <p className="text-justify mb-4">Étienne le regardait, regardait le sol qu''il tachait de la sorte.</p><br />
  
  <p className="text-justify mb-4">— Il y a longtemps, reprit-il, que vous travaillez à la mine ? </p><br />
  
  <p className="text-justify mb-4">Bonnemort ouvrit tout grands les deux bras.</p><br />
  
  <p className="text-justify mb-4">— Longtemps, ah ! oui !… Je n''avais pas huit ans, lorsque je suis descendu, tenez ! juste dans le Voreux, et j''en ai cinquante-huit, à cette heure. 
  Calculez un peu… J''ai tout fait là-dedans, galibot d''abord, puis herscheur, quand j''ai eu la force de rouler, puis haveur pendant dix-huit ans. 
  Ensuite, à cause de mes sacrées jambes, ils m''ont mis de la coupe à terre, remblayeur, raccommodeur, jusqu''au moment où il leur a fallu me sortir du fond, 
  parce que le médecin disait que j''allais y rester. Alors, il y a cinq années de cela, ils m''ont fait charretier… Hein ? c''est joli, cinquante ans de mine, 
  dont quarante-cinq au fond !</p><br />
  
  <p className="text-justify mb-4">Tandis qu''il parlait, des morceaux de houille enflammés, qui, par moments, tombaient de la corbeille, allumaient sa face blême d''un reflet sanglant.</p><br />
  
  <p className="text-justify mb-4">— Ils me disent de me reposer, continua-t-il. Moi, je ne veux pas, ils me croient trop bête !… J''irai bien deux années, jusqu''à ma soixantaine, 
  pour avoir la pension de cent quatre-vingts francs. Si je leur souhaitais le bonsoir aujourd''hui, ils m''accorderaient tout de suite celle de cent cinquante. 
  Ils sont malins, les bougres !… D''ailleurs, je suis solide, à part les jambes. C''est, voyez-vous, l''eau qui m''est entrée sous la peau, à force d''être 
  arrosé dans les tailles. Il y a des jours où je ne peux pas remuer une patte sans crier.</p><br />
  
  <p className="text-justify mb-4">Une crise de toux l''interrompit encore.</p><br />
  
  <p className="text-justify mb-4">— Et ça vous fait tousser aussi ? dit Étienne.</p><br />
  
  <p className="text-justify mb-4">Mais il répondit non de la tête, violemment. Puis, quand il put parler :</p><br />
  
  <p className="text-justify mb-4">— Non, non, je me suis enrhumé, l''autre mois. Jamais je ne toussais, à présent je ne peux plus me débarrasser… Et le drôle, c''est que je crache, c''est que je crache…</p><br />
  
  <p className="text-justify mb-4">Un raclement monta de sa gorge, il cracha noir.</p><br />
  
  <p className="text-justify mb-4">— Est-ce que c''est du sang ? demanda Étienne, osant enfin le questionner.</p><br />
  
  <p className="text-justify mb-4">Lentement, Bonnemort s''essuyait la bouche d''un revers de main.</p><br />
  
  <p className="text-justify mb-4">— C''est du charbon… J''en ai dans la carcasse de quoi me chauffer jusqu''à la fin de mes jours. Et voilà cinq ans que je ne remets pas les pieds au fond. 
  J''avais ça en magasin, paraît-il, sans même m''en douter. Bah ! ça conserve !</p><br />
  
  <p className="text-justify mb-4">Il y eut un silence, le marteau lointain battait à coups réguliers dans la fosse, le vent passait avec sa plainte, comme un cri de faim et de lassitude 
  venu des profondeurs de la nuit. Devant les flammes qui s''effaraient, le vieux continuait plus bas, remâchant des souvenirs. Ah ! bien sûr, ce n''était pas 
  d''hier que lui et les siens tapaient à la veine ! La famille travaillait pour la Compagnie des mines de Montsou, depuis la création ; et cela datait de loin, 
  il y avait déjà cent six ans. Son aïeul, Guillaume Maheu, un gamin de quinze ans alors, avait trouvé le charbon gras à Réquillart, la première fosse de la Compagnie, 
  une vieille fosse aujourd''hui abandonnée, là-bas, près de la sucrerie Fauvelle. Tout le pays le savait, à preuve que la veine découverte s''appelait la veine 
  Guillaume, du prénom de son grand-père. Il ne l''avait pas connu, un gros à ce qu''on racontait, très fort, mort de vieillesse à soixante ans. 
  Puis, son père, Nicolas Maheu dit le Rouge, âgé de quarante ans à peine, était resté dans le Voreux, que l''on fonçait en ce temps-là : un éboulement, 
  un aplatissement complet, le sang bu et les os avalés par les roches. Deux de ses oncles et ses trois frères, plus tard, y avaient aussi laissé leur peau. 
  Lui, Vincent Maheu, qui en était sorti à peu près entier, les jambes mal d''aplomb seulement, passait pour un malin. Quoi faire, d''ailleurs ? Il fallait travailler. 
  On faisait ça de père en fils, comme on aurait fait autre chose. Son fils, Toussaint Maheu, y crevait maintenant, et ses petits-fils, et tout son monde, qui 
  logeait en face, dans le coron. Cent six ans d''abattage, les mioches après les vieux, pour le même patron : hein ? beaucoup de bourgeois n''auraient pas su dire si bien leur histoire !</p><br />
  
  <p className="text-justify mb-4">— Encore, lorsqu''on mange ! murmura de nouveau Étienne.</p><br />
  
  <p className="text-justify mb-4">— C''est ce que je dis, tant qu''on a du pain à manger, on peut vivre.</p><br />
  
  <p className="text-justify mb-4">Bonnemort se tut, les yeux tournés vers le coron, où des lueurs s''allumaient une à une. Quatre heures sonnaient au clocher de Montsou, le froid devenait plus vif.</p><br />
  
  <p className="text-justify mb-4">— Et elle est riche, votre Compagnie ? reprit Étienne.</p><br />
  
  <p className="text-justify mb-4">Le vieux haussa les épaules, puis les laissa retomber, comme accablé sous un écroulement d''écus.</p><br />
  
  <p className="text-justify mb-4">— Ah ! oui, ah ! oui… Pas aussi riche peut-être que sa voisine, la Compagnie d''Anzin. Mais des millions et des millions tout de même. On ne compte plus… 
  Dix-neuf fosses, dont treize pour l''exploitation, le Voreux, la Victoire, Crèvecœur, Mirou, Saint-Thomas, Madeleine, Feutry-Cantel, d''autres encore, et six 
  pour l''épuisement ou l''aérage, comme Réquillart… Dix mille ouvriers, des concessions qui s''étendent sur soixante-sept communes, une extraction de cinq mille 
  tonnes par jour, un chemin de fer reliant toutes les fosses, et des ateliers, et des fabriques !… Ah ! oui, ah ! oui, il y en a, de l''argent !</p><br />
  
  <p className="text-justify mb-4">Un roulement de berlines, sur les tréteaux, fit dresser les oreilles du gros cheval jaune. En bas, la cage devait être réparée, les moulineurs avaient 
  repris leur besogne. Pendant qu''il attelait sa bête, pour redescendre, le charretier ajouta doucement, en s''adressant à elle :</p><br />
  
  <p className="text-justify mb-4">— Faut pas t''habituer à bavarder, fichu paresseux !… Si monsieur Hennebeau savait à quoi tu perds le temps !</p><br />
  
  <p className="text-justify mb-4">Étienne, songeur, regardait la nuit. Il demanda :</p><br />
  
  <p className="text-justify mb-4">— Alors, c''est à monsieur Hennebeau, la mine ?</p><br />
  
  <p className="text-justify mb-4">— Non, expliqua le vieux, monsieur Hennebeau n''est que le directeur général. Il est payé comme nous.</p><br />
  
  <p className="text-justify mb-4">D''un geste, le jeune homme montra l''immensité des ténèbres.</p><br />
  
  <p className="text-justify mb-4">— À qui est-ce donc, tout ça ?</p><br />
  
  <p className="text-justify mb-4">Mais Bonnemort resta un instant suffoqué par une nouvelle crise, d''une telle violence, qu''il ne pouvait reprendre haleine. Enfin, quand il eut 
  craché et essuyé l''écume noire de ses lèvres, il dit, dans le vent qui redoublait :</p><br />
  
  <p className="text-justify mb-4">— Hein ? à qui tout ça ?… On n''en sait rien. À des gens.</p><br />
  
  <p className="text-justify mb-4">Et, de la main, il désignait dans l''ombre un point vague, un lieu ignoré et reculé, peuplé de ces gens, pour qui les Maheu tapaient à la veine 
  depuis plus d''un siècle. Sa voix avait pris une sorte de peur religieuse, c''était comme s''il eût parlé d''un tabernacle inaccessible, où se cachait 
  le dieu repu et accroupi, auquel ils donnaient tous leur chair, et qu''ils n''avaient jamais vu.</p><br />
  
  <p className="text-justify mb-4">— Au moins si l''on mangeait du pain à sa suffisance ! répéta pour la troisième fois Étienne, sans transition apparente.</p><br />
  
  <p className="text-justify mb-4">— Dame, oui ! si l''on mangeait toujours du pain, ce serait trop beau !</p><br />
  
  <p className="text-justify mb-4">Le cheval était parti, le charretier disparut à son tour, d''un pas traînard d''invalide. Près du culbuteur, le manœuvre n''avait point bougé, 
  ramassé en boule, enfonçant le menton entre ses genoux, fixant sur le vide ses gros yeux éteints.</p><br />
  
  <p className="text-justify mb-4">Quand il eut repris son paquet, Étienne ne s''éloigna pas encore. Il sentait les rafales lui glacer le dos, pendant que sa poitrine brûlait, 
  devant le grand feu. Peut-être, tout de même, ferait-il bien de s''adresser à la fosse : le vieux pouvait ne pas savoir ; puis, il se résignait, 
  il accepterait n''importe quelle besogne. Où aller et que devenir, à travers ce pays affamé par le chômage ? laisser derrière un mur sa carcasse de chien perdu ? 
  Cependant, une hésitation le troublait, une peur du Voreux, au milieu de cette plaine rase, noyée sous une nuit si épaisse. À chaque bourrasque, le vent 
  paraissait grandir, comme s''il eût soufflé d''un horizon sans cesse élargi. Aucune aube ne blanchissait dans le ciel mort, les hauts fourneaux seuls flambaient, 
  ainsi que les fours à coke, ensanglantant les ténèbres, sans en éclairer l''inconnu. Et le Voreux, au fond de son trou, avec son tassement de bête méchante, 
  s''écrasait davantage, respirait d''une haleine plus grosse et plus longue, l''air gêné par sa digestion pénible de chair humaine.</p><br />
  '
  ),


  ('Notre-Dame de Paris', 

  'Victor Hugo', 

  'Fresque historique centrée sur la cathédrale parisienne et la tragédie de Quasimodo, ce roman explore l''amour, la destinée et les inégalités au Moyen Âge.', 

  'Roman Historique', 

  true, 

  'https://i.imgur.com/JPdm5za.jpg', 

  7,

  '<h2>ἈΝΆΓΚΗ</h2>
  
  <p className="text-justify mb-4">Ces majuscules grecques, noires de vétusté et assez profondément entaillées dans la pierre, je ne sais quels signes propres à la calligraphie gothique 
  empreints dans leurs formes et dans leurs attitudes, comme pour révéler que c''était une main du moyen-âge qui les avait écrites là, surtout le sens lugubre 
  et fatal qu''elles renferment, frappèrent vivement l''auteur.</p><br />
  
  <p className="text-justify mb-4">Il se demanda, il chercha à deviner quelle pouvait être l''âme en peine qui n''avait pas voulu quitter ce monde sans laisser ce stigmate de crime ou de malheur au front de la vieille église.</p><br />
  
  <p className="text-justify mb-4">Depuis, on a badigeonné ou gratté (je ne sais plus lequel) le mur, et l''inscription a disparu. Car c''est ainsi qu''on agit depuis tantôt deux cents ans 
  avec les merveilleuses églises du moyen-âge. Les mutilations leur viennent de toutes parts, du dedans comme du dehors. Le prêtre les badigeonne, l''architecte 
  les gratte, puis le peuple survient, qui les démolit.</p><br />
  
  <p className="text-justify mb-4">Ainsi, hormis le fragile souvenir que lui consacre ici l''auteur de ce livre, il ne reste plus rien aujourd''hui du mot mystérieux gravé dans la sombre tour 
  de Notre-Dame, rien de la destinée inconnue qu''il résumait si mélancoliquement. L''homme qui a écrit ce mot sur ce mur s''est effacé, il y a plusieurs siècles, 
  du milieu des générations, le mot s''est à son tour effacé du mur de l''église, l''église elle-même s''effacera bientôt peut-être de la terre.</p><br />
  
  <p className="text-justify mb-4">Ainsi, hormis le fragile souvenir que lui consacre ici l''auteur de ce livre, il ne reste plus rien aujourd''hui du mot mystérieux gravé dans la sombre 
  tour de Notre-Dame, rien de la destinée inconnue qu''il résumait si mélancoliquement. L''homme qui a écrit ce mot sur ce mur s''est effacé, il y a plusieurs 
  siècles, du milieu des générations, le mot s''est à son tour effacé du mur de l''église, l''église elle-même s''effacera bientôt peut-être de la terre.</p><br />
  ',
  
  '<h1>LA GRAND''SALLE.</h1>
  <h2>CHAPITRE I</h2>

  <p className="text-justify mb-4">Il y a aujourd''hui trois cent quarante-huit ans six mois et dix-neuf jours que les parisiens s''éveillèrent au bruit de toutes les cloches sonnant à grande 
  volée dans la triple enceinte de la Cité, de l''Université et de la Ville.</p><br />
  
  <p className="text-justify mb-4">Ce n''est cependant pas un jour dont l''histoire ait gardé souvenir que le 6 janvier 1482. Rien de notable dans l''événement qui mettait ainsi en branle, 
  dès le matin, les cloches et les bourgeois de Paris. Ce n''était ni un assaut de picards ou de bourguignons, ni une châsse menée en procession, ni une révolte 
  d''écoliers dans la vigne de Laas, ni une entrée de notredit très redouté seigneur monsieur le roi, ni même une belle pendaison de larrons et de larronnesses à 
  la Justice de Paris. Ce n''était pas non plus la survenue, si fréquente au quinzième siècle, de quelque ambassade chamarrée et empanachée. Il y avait à peine 
  deux jours que la dernière cavalcade de ce genre, celle des ambassadeurs flamands chargés de conclure le mariage entre le dauphin et Marguerite de Flandre, 
  avait fait son entrée à Paris, au grand ennui de M. le cardinal de Bourbon, qui, pour plaire au roi, avait dû faire bonne mine à toute cette rustique cohue 
  de bourgmestres flamands, et les régaler, en son hôtel de Bourbon, d''une moult belle moralité, sotie & farce, tandis qu''une pluie battante inondait à sa 
  porte ses magnifiques tapisseries.</p><br />
  
  <p className="text-justify mb-4">Le 6 janvier, ce qui mettait en émotion tout le populaire de Paris, comme dit Jean de Troyes, c''était la double solennité, réunie depuis un temps immémorial, du jour des Rois et de la Fête des Fous.</p><br />
  
  <p className="text-justify mb-4">Ce jour-là, il devait y avoir feu de joie à la Grève, plantation de mai à la chapelle de Braque et mystère au Palais de Justice. Le cri en avait été fait la 
  veille à son de trompe dans les carrefours, par les gens de M. le prévôt, en beaux hoquetons de camelot violet, avec de grandes croix blanches sur la poitrine.</p><br />
  
  <p className="text-justify mb-4">La foule des bourgeois et des bourgeoises s''acheminait donc de toutes parts dès le matin, maisons et boutiques fermées, vers l''un des trois endroits désignés. 
  Chacun avait pris parti, qui pour le feu de joie, qui pour le mai, qui pour le mystère. Il faut dire, à l''éloge de l''antique bon sens des badauds de Paris, 
  que la plus grande partie de cette foule se dirigeait vers le feu de joie, lequel était tout à fait de saison, ou vers le mystère, qui devait être représenté 
  dans la grand''salle du Palais bien couverte et bien close, et que les curieux s''accordaient à laisser le pauvre mai mal fleuri grelotter tout seul sous le 
  ciel de janvier dans le cimetière de la chapelle de Braque.</p><br />
  
  <p className="text-justify mb-4">Le peuple affluait surtout dans les avenues du Palais de Justice, parce qu''on savait que les ambassadeurs flamands, arrivés de la surveille, se proposaient 
  d''assister à la représentation du mystère et à l''élection du pape des fous, laquelle devait se faire également dans la grand''salle.</p><br />
  
  <p className="text-justify mb-4">Ce n''était pas chose aisée de pénétrer ce jour-là dans cette grand''salle, réputée cependant alors la plus grande enceinte couverte qui fût au monde. 
  (Il est vrai que Sauval n''avait pas encore mesuré la grande salle du château de Montargis.) La place du Palais, encombrée de peuple, offrait aux curieux des 
  fenêtres l''aspect d''une mer, dans laquelle cinq ou six rues, comme autant d''embouchures de fleuves, dégorgeaient à chaque instant de nouveaux flots de têtes. 
  Les ondes de cette foule, sans cesse grossies, se heurtaient aux angles des maisons qui s''avançaient çà et là, comme autant de promontoires, dans le bassin 
  irrégulier de la place. Au centre de la haute façade gothique[1] du Palais, le grand escalier, sans relâche remonté et descendu par un double courant qui, 
  après s''être brisé sous le perron intermédiaire, s''épandait à larges vagues sur ses deux pentes latérales, le grand escalier, dis-je, ruisselait incessamment 
  dans la place comme une cascade dans un lac. Les cris, les rires, le trépignement de ces mille pieds faisaient un grand bruit et une grande clameur. 
  De temps en temps cette clameur et ce bruit redoublaient, le courant qui poussait toute cette foule vers le grand escalier rebroussait, se troublait, tourbillonnait. 
  C''était une bourrade d''un archer ou le cheval d''un sergent de la prévôté qui ruait pour rétablir l''ordre ; admirable tradition que la prévôté a léguée à la 
  connétablie, la connétablie à la maréchaussée, et la maréchaussée à notre gendarmerie de Paris.</p><br />
  
  <p className="text-justify mb-4">Aux portes, aux fenêtres, aux lucarnes, sur les toits, fourmillaient des milliers de bonnes figures bourgeoises, calmes et honnêtes, regardant le palais, 
  regardant la cohue, et n''en demandant pas davantage ; car bien des gens à Paris se contentent du spectacle des spectateurs, et c''est déjà pour nous une chose 
  très curieuse qu''une muraille derrière laquelle il se passe quelque chose.</p><br />
  
  <p className="text-justify mb-4">S''il pouvait nous être donné à nous, hommes de 1830, de nous mêler en pensée à ces parisiens du quinzième siècle et d''entrer avec eux, tiraillés, coudoyés, 
  culbutés, dans cette immense salle du Palais, si étroite le 6 janvier 1482, le spectacle ne serait ni sans intérêt ni sans charme, et nous n''aurions autour de 
  nous que des choses si vieilles qu''elles nous sembleraient toutes neuves.</p><br />
  
  <p className="text-justify mb-4">Si le lecteur y consent, nous essaierons de retrouver par la pensée l''impression qu''il eût éprouvée avec nous en franchissant le seuil de cette grand 
  salle au milieu de cette cohue en surcot, en hoqueton et en cotte-hardie.</p><br />
  
  <p className="text-justify mb-4">Et d''abord, bourdonnement dans les oreilles, éblouissement dans les yeux. Au-dessus de nos têtes une double voûte en ogive, lambrissée en sculptures de bois, 
  peinte d''azur, fleurdelysée en or ; sous nos pieds, un pavé alternatif de marbre blanc et noir. À quelques pas de nous, un énorme pilier, puis un autre, 
  puis un autre ; en tout sept piliers dans la longueur de la salle, soutenant au milieu de sa largeur les retombées de la double voûte. Autour des quatre premiers 
  piliers, des boutiques de marchands, tout étincelantes de verre et de clinquants ; autour des trois derniers, des bancs de bois de chêne, usés et polis par le 
  haut-de-chausses des plaideurs et la robe des procureurs. À l''entour de la salle, le long de la haute muraille, entre les portes, entre les croisées, entre les 
  piliers, l''interminable rangée des statues de tous les rois de France depuis Pharamond ; les rois fainéants, les bras pendants et les yeux baissés ; les rois 
  vaillants et bataillards, la tête et les mains hardiment levées au ciel. Puis, aux longues fenêtres ogives, des vitraux de mille couleurs ; aux larges issues de 
  la salle, de riches portes finement sculptées ; et le tout, voûtes, piliers, murailles, chambranles, lambris, portes, statues, recouvert du haut en bas d''une 
  splendide enluminure bleu et or, qui, déjà un peu ternie à l''époque où nous la voyons, avait presque entièrement disparu sous la poussière et les toiles 
  d''araignée en l''an de grâce 1549, où du Breul l''admirait encore par tradition.</p><br />
  
  <p className="text-justify mb-4">Qu''on se représente maintenant cette immense salle oblongue, éclairée de la clarté blafarde d''un jour de janvier, envahie par une foule bariolée et bruyante 
  qui dérive le long des murs et tournoie autour des sept piliers, et l''on aura déjà une idée confuse de l''ensemble du tableau dont nous allons essayer d''indiquer 
  plus précisément les curieux détails.</p><br />
  
  <p className="text-justify mb-4">Il est certain que, si Ravaillac n''avait point assassiné Henri iv, il n''y aurait point eu de pièces du procès de Ravaillac déposées au greffe du Palais de 
  Justice ; point de complices intéressés à faire disparaître lesdites pièces ; partant, point d''incendiaires obligés, faute de meilleur moyen, à brûler le greffe 
  pour brûler les pièces, et à brûler le Palais de Justice pour brûler le greffe ; par conséquent enfin, point d''incendie de 1618. Le vieux Palais serait encore 
  debout avec sa vieille grand''salle ; je pourrais dire au lecteur : Allez la voir ; et nous serions ainsi dispensés tous deux, moi d''en faire, lui d''en lire une 
  description telle quelle. — Ce qui prouve cette vérité neuve : que les grands événements ont des suites incalculables.</p><br />
  
  <p className="text-justify mb-4">Il est vrai qu''il serait fort possible d''abord que Ravaillac n''eût pas de complices, ensuite que ses complices, si par hasard il en avait, ne fussent pour 
  rien dans l''incendie de 1618. Il en existe deux autres explications très plausibles. Premièrement, la grande étoile enflammée, large d''un pied, haute d''une coudée, 
  qui tomba, comme chacun sait, du ciel sur le Palais, le 7 mars après minuit. Deuxièmement, le quatrain de Théophile :</p><br />
  
  <p className="text-justify mb-4">Certes, ce fut un triste jeu. Quand à Paris dame Justice, Pour avoir mangé trop d''épice, Se mit tout le palais en feu.</p><br />
  
  <p className="text-justify mb-4">Quoi qu''on pense de cette triple explication politique, physique, poétique, de l''incendie du Palais de Justice en 1618, le fait malheureusement certain, 
  c''est l''incendie. Il reste bien peu de chose aujourd''hui, grâce à cette catastrophe, grâce surtout aux diverses restaurations successives qui ont achevé ce 
  qu''elle avait épargné, il reste bien peu de chose de cette première demeure des rois de France, de ce palais aîné du Louvre, déjà si vieux du temps de Philippe 
  le Bel qu''on y cherchait les traces des magnifiques bâtiments élevés par le roi Robert et décrits par Helgaldus. Presque tout a disparu. Qu''est devenue la 
  chambre de la chancellerie où saint Louis consomma son mariage ? le jardin où il rendait la justice, « vêtu d''une cotte de camelot, d''un surcot de tiretaine 
  sans manches, et d''un manteau par-dessus de sandal noir, couché sur des tapis, avec Joinville » ? Où est la chambre de l''empereur Sigismond ? celle de 
  Charles iv ? celle de Jean sans Terre ? Où est l''escalier d''où Charles vi promulgua son édit de grâce ? la dalle où Marcel égorgea, en présence du dauphin, 
  Robert de Clermont et le maréchal de Champagne ? le guichet où furent lacérées les bulles de l''antipape Bénédict, et d''où repartirent ceux qui les avaient 
  apportées, chapés et mitrés en dérision, et faisant amende honorable par tout Paris ? et la grand''salle, avec sa dorure, son azur, ses ogives, ses statues, 
  ses piliers, son immense voûte toute déchiquetée de sculptures ? et la chambre dorée ? et le lion de pierre qui se tenait à la porte, la tête baissée, 
  la queue entre les jambes, comme les lions du trône de Salomon, dans l''attitude humiliée qui convient à la force devant la justice ? et les belles portes ? et 
  les beaux vitraux ? et les ferrures ciselées qui décourageaient Biscornette ? et les délicates menuiseries de Du Hancy ?… Qu''a fait le temps, qu''ont fait les 
  hommes de ces merveilles ? Que nous a-t-on donné pour tout cela, pour toute cette histoire gauloise, pour tout cet art gothique ? les lourds cintres surbaissés de M. de Brosse, 
  ce gauche architecte du portail Saint-Gervais, voilà pour l''art ; et quant à l''histoire, nous avons les souvenirs bavards du gros pilier, encore tout retentissant 
  des commérages des Patrus.</p><br />
  
  <p className="text-justify mb-4">Ce n''est pas grand''chose. — Revenons à la véritable grand''salle du véritable vieux Palais.</p><br />
  
  <p className="text-justify mb-4">Les deux extrémités de ce gigantesque parallélogramme étaient occupées, l''une par la fameuse table de marbre, si longue, si large et si épaisse que jamais 
  on ne vit, disent les vieux papiers terriers, dans un style qui eût donné appétit à Gargantua, pareille tranche de marbre au monde ; l''autre, par la chapelle 
  où Louis XI s''était fait sculpter à genoux devant la Vierge, et où il avait fait transporter, sans se soucier de laisser deux niches vides dans la file des statues 
  royales, les statues de Charlemagne et de saint Louis, deux saints qu''il supposait fort en crédit au ciel comme rois de France. Cette chapelle, neuve encore, 
  bâtie à peine depuis six ans, était toute dans ce goût charmant d''architecture délicate, de sculpture merveilleuse, de fine et profonde ciselure qui marque 
  chez nous la fin de l''ère gothique et se perpétue jusque vers le milieu du seizième siècle dans les fantaisies féeriques de la renaissance. La petite rosace 
  à jour percée au-dessus du portail était en particulier un chef-d''œuvre de ténuité et de grâce ; on eût dit une étoile de dentelle.</p><br />
  
  <p className="text-justify mb-4">Au milieu de la salle, vis-à-vis la grande porte, une estrade de brocart d''or, adossée au mur, et dans laquelle était pratiquée une entrée particulière 
  au moyen d''une fenêtre du couloir de la chambre dorée, avait été élevée pour les envoyés flamands et les autres gros personnages conviés à la représentation 
  du mystère.</p><br />
  
  <p className="text-justify mb-4">C''est sur la table de marbre que devait, selon l''usage, être représenté le mystère. Elle avait été disposée pour cela dès le matin ; sa riche planche 
  de marbre, toute rayée par les talons de la basoche, supportait une cage de charpente assez élevée, dont la surface supérieure, accessible aux regards de 
  toute la salle, devait servir de théâtre, et dont l''intérieur, masqué par des tapisseries, devait tenir lieu de vestiaire aux personnages de la pièce. 
  Une échelle, naïvement placée en dehors, devait établir la communication entre la scène et le vestiaire, et prêter ses roides échelons aux entrées comme aux sorties. 
  Il n''y avait pas de personnage si imprévu, pas de péripétie, pas de coup de théâtre qui ne fût tenu de monter par cette échelle. Innocente et vénérable enfance de l''art et des machines !</p><br />
  
  <p className="text-justify mb-4">Quatre sergents du bailli du Palais, gardiens obligés de tous les plaisirs du peuple les jours de fête comme les jours d''exécution, se tenaient debout aux quatre coins de la table de marbre.</p><br />
  
  <p className="text-justify mb-4">Ce n''était qu''au douzième coup de midi sonnant à la grande horloge du Palais que la pièce devait commencer. C''était bien tard sans doute pour une 
  représentation théâtrale ; mais il avait fallu prendre l''heure des ambassadeurs.</p><br />
  
  <p className="text-justify mb-4">Or toute cette multitude attendait depuis le matin. Bon nombre de ces honnêtes curieux grelottaient dès le point du jour devant le grand degré du Palais ; 
  quelques-uns même affirmaient avoir passé la nuit en travers de la grande porte pour être sûrs d''entrer les premiers. La foule s''épaississait à tout moment, et, 
  comme une eau qui dépasse son niveau, commençait à monter le long des murs, à s''enfler autour des piliers, à déborder sur les entablements, sur les corniches, 
  sur les appuis des fenêtres, sur toutes les saillies de l''architecture, sur tous les reliefs de la sculpture. Aussi la gêne, l''impatience, l''ennui, la liberté 
  d''un jour de cynisme et de folie, les querelles qui éclataient à tout propos pour un coude pointu ou un soulier ferré, la fatigue d''une longue attente, 
  donnaient-elles déjà, bien avant l''heure où les ambassadeurs devaient arriver, un accent aigre et amer à la clameur de ce peuple enfermé, emboîté, pressé, 
  foulé, étouffé. On n''entendait que plaintes et imprécations contre les flamands, le prévôt des marchands, le cardinal de Bourbon, le bailli du Palais, 
  madame Marguerite d''Autriche, les sergents à verge, le froid, le chaud, le mauvais temps, l''évêque de Paris, le pape des fous, les piliers, les statues, 
  cette porte fermée, cette fenêtre ouverte ; le tout au grand amusement des bandes d''écoliers et de laquais disséminées dans la masse, qui mêlaient à tout 
  ce mécontentement leurs taquineries et leurs malices, et piquaient, pour ainsi dire, à coups d''épingle la mauvaise humeur générale.</p><br />
  
  <p className="text-justify mb-4">Il y avait entre autres un groupe de ces joyeux démons qui, après avoir défoncé le vitrage d''une fenêtre, s''était hardiment assis sur l''entablement, et 
  de là plongeait tour à tour ses regards et ses railleries au dedans et au dehors, dans la foule de la salle et dans la foule de la place. À leurs gestes 
  de parodie, à leurs rires éclatants, aux appels goguenards qu''ils échangeaient d''un bout à l''autre de la salle avec leurs camarades, il était aisé de juger 
  que ces jeunes clercs ne partageaient pas l''ennui et la fatigue du reste des assistants, et qu''ils savaient fort bien, pour leur plaisir particulier, 
  extraire de ce qu''ils avaient sous les yeux un spectacle qui leur faisait attendre patiemment l''autre.</p><br />
  
  <p className="text-justify mb-4">— Sur mon âme, c''est vous, Joannes Frollo de Molendino ! criait l''un d''eux à une espèce de petit diable blond, à jolie et maligne figure, accroché aux 
  acanthes d''un chapiteau ; vous êtes bien nommé Jehan du Moulin, car vos deux bras et vos deux jambes ont l''air de quatre ailes qui vont au vent. — Depuis combien de temps êtes-vous ici ?</p><br />
  
  <p className="text-justify mb-4">— Par la miséricorde du diable, répondit Joannes Frollo, voilà plus de quatre heures, et j''espère bien qu''elles me seront comptées sur mon temps de purgatoire. 
  J''ai entendu les huit chantres du roi de Sicile entonner le premier verset de la haute messe de sept heures dans la Sainte-Chapelle.</p><br />
  
  <p className="text-justify mb-4">— De beaux chantres, reprit l''autre, et qui ont la voix encore plus pointue que leur bonnet ! Avant de fonder une messe à monsieur saint Jean, le roi 
  aurait bien dû s''informer si monsieur saint Jean aime le latin psalmodié avec accent provençal.</p><br />
  
  <p className="text-justify mb-4">— C''est pour employer ces maudits chantres du roi de Sicile qu''il a fait cela ! cria aigrement une vieille femme dans la foule au bas de la fenêtre. 
  Je vous demande un peu ! mille livres parisis pour une messe ! et sur la ferme du poisson de mer des halles de Paris, encore !</p><br />
  
  <p className="text-justify mb-4">— Paix ! vieille, reprit un gros et grave personnage qui se bouchait le nez à côté de la marchande de poisson ; il fallait bien fonder une messe. Vouliez-vous pas que le roi retombât malade ?</p><br />
  
  <p className="text-justify mb-4">— Bravement parlé, sire Gilles Lecornu, maître pelletier-fourreur des robes du roi ! cria le petit écolier cramponné au chapiteau.</p><br />
  
  <p className="text-justify mb-4">Un éclat de rire de tous les écoliers accueillit le nom malencontreux du pauvre pelletier-fourreur des robes du roi.</p><br />
  
  <p className="text-justify mb-4">— Lecornu ! Gilles Lecornu ! disaient les uns.</p><br />
  
  <p className="text-justify mb-4">— Cornutus et hirsutus, reprenait un autre.</p><br />
  
  <p className="text-justify mb-4">— Hé ! sans doute, continuait le petit démon du chapiteau. Qu''ont-ils à rire ? Honorable homme Gilles Lecornu, frère de maître Jehan Lecornu, 
  prévôt de l''hôtel du roi, fils de maître Mahiet Lecornu, premier portier du bois de Vincennes, tous bourgeois de Paris, tous mariés de père en fils !</p><br />
  
  <p className="text-justify mb-4">La gaieté redoubla. Le gros pelletier-fourreur, sans répondre un mot, s''efforçait de se dérober aux regards fixés sur lui de tous côtés ; 
  mais il suait et soufflait en vain : comme un coin qui s''enfonce dans le bois, les efforts qu''il faisait ne servaient qu''à emboîter plus solidement 
  dans les épaules de ses voisins sa large face apoplectique, pourpre de dépit et de colère.</p><br />
  
  <p className="text-justify mb-4">Enfin un de ceux-ci, gros, court et vénérable comme lui, vint à son secours.</p><br />
  
  <p className="text-justify mb-4">— Abomination ! des écoliers qui parlent de la sorte à un bourgeois ! de mon temps on les eût fustigés avec un fagot dont on les eût brûlés ensuite.</p><br />
  
  <p className="text-justify mb-4">La bande entière éclata.</p><br />
  
  <p className="text-justify mb-4">— Holàhée ! qui chante cette gamme ? quel est le chat-huant de malheur ?</p><br />
  
  <p className="text-justify mb-4">— Tiens, je le reconnais, dit l''un ; c''est maître Andry Musnier.</p><br />
  
  <p className="text-justify mb-4">— Parce qu''il est un des quatre libraires jurés de l''Université ! dit l''autre.</p><br />
  
  <p className="text-justify mb-4">— Tout est par quatre dans cette boutique, cria un troisième : les quatre nations, les quatre facultés, les quatre fêtes, les quatre procureurs, les quatre électeurs, les quatre libraires.</p><br />
  
  <p className="text-justify mb-4">— Eh bien, reprit Jean Frollo, il faut leur faire le diable à quatre.</p><br />
  
  <p className="text-justify mb-4">— Musnier, nous brûlerons tes livres.</p><br />
  
  <p className="text-justify mb-4">— Musnier, nous battrons ton laquais.</p><br />
  
  <p className="text-justify mb-4">— Musnier, nous chiffonnerons ta femme.</p><br />
  
  <p className="text-justify mb-4">— La bonne grosse mademoiselle Oudarde.</p><br />
  
  <p className="text-justify mb-4">— Qui est aussi fraîche et aussi gaie que si elle était veuve.</p><br />
  
  <p className="text-justify mb-4">— Que le diable vous emporte ! grommela maître Andry Musnier.</p><br />
  
  <p className="text-justify mb-4">— Maître Andry, reprit Jehan, toujours pendu à son chapiteau, tais-toi, ou je te tombe sur la tête !</p><br />
  
  <p className="text-justify mb-4">Maître Andry leva les yeux, parut mesurer un instant la hauteur du pilier, la pesanteur du drôle, multiplia mentalement cette pesanteur par le carré de la vitesse, et se tut.</p><br />
  
  <p className="text-justify mb-4">Jehan, maître du champ de bataille, poursuivit avec triomphe :</p><br />
  
  <p className="text-justify mb-4">— C''est que je le ferais, quoique je sois frère d''un archidiacre !</p><br />
  
  <p className="text-justify mb-4">— Beaux sires, que nos gens de l''Université ! n''avoir seulement pas fait respecter nos privilèges dans un jour comme celui-ci ! Enfin, il y a 
  mai et feu de joie à la Ville ; mystère, pape des fous et ambassadeurs flamands à la Cité ; et à l''Université, rien !</p><br />
  
  <p className="text-justify mb-4">— Cependant la place Maubert est assez grande ! reprit un des clercs cantonnés sur la table de la fenêtre.</p><br />
  
  <p className="text-justify mb-4">— À bas le recteur, les électeurs et les procureurs ! cria Joannes.</p><br />
  
  <p className="text-justify mb-4">— Il faudra faire un feu de joie ce soir dans le Champ-Gaillard, poursuivit l''autre, avec les livres de maître Andry.</p><br />
  
  <p className="text-justify mb-4">— Et les pupitres des scribes ! dit son voisin.</p><br />
  
  <p className="text-justify mb-4">— Et les verges des bedeaux !</p><br />
  
  <p className="text-justify mb-4"> — Et les crachoirs des doyens ! </p><br />

  <p className="text-justify mb-4">— Et les buffets des procureurs ! </p><br />
  
  <p className="text-justify mb-4">— Et les huches des électeurs !</p><br />
  
  <p className="text-justify mb-4">— Et les escabeaux du recteur !</p><br />
  
  <p className="text-justify mb-4">— À bas ! reprit le petit Jehan en faux-bourdon ; à bas maître Andry, les bedeaux et les scribes ; les théologiens, les médecins et les décrétistes ; les procureurs, les électeurs et le recteur !</p><br />
  
  <p className="text-justify mb-4">— C''est donc la fin du monde ! murmura maître Andry en se bouchant les oreilles.</p><br />
  
  <p className="text-justify mb-4">— À propos, le recteur ! le voici qui passe dans la place, cria un de ceux de la fenêtre.</p><br />
  
  <p className="text-justify mb-4">Ce fut à qui se retournerait vers la place.</p><br />
  
  <p className="text-justify mb-4">— Est-ce que c''est vraiment notre vénérable recteur maître Thibaut ? demanda Jehan Frollo du Moulin, qui, s''étant accroché à un pilier de l''intérieur, ne pouvait voir ce qui se passait au dehors.</p><br />
  
  <p className="text-justify mb-4">— Oui, oui, répondirent tous les autres, c''est lui, c''est bien lui, maître Thibaut le recteur.</p><br />
  
  <p className="text-justify mb-4">C''était en effet le recteur et tous les dignitaires de l''Université qui se rendaient processionnellement au-devant de l''ambassade et traversaient en ce 
  moment la place du Palais. Les écoliers, pressés à la fenêtre, les accueillirent au passage avec des sarcasmes et des applaudissements ironiques. Le recteur, 
  qui marchait en tête de sa compagnie, essuya la première bordée ; elle fut rude.</p><br />
  
  <p className="text-justify mb-4">— Bonjour, monsieur le recteur ! Holàhée ! bonjour donc !</p><br />
  
  <p className="text-justify mb-4">— Comment fait-il pour être ici, le vieux joueur ? il a donc quitté ses dés ?</p><br />
  
  <p className="text-justify mb-4">— Comme il trotte sur sa mule ! elle a les oreilles moins longues que lui.</p><br />
  
  <p className="text-justify mb-4">— Holàhée ! bonjour, monsieur le recteur Thibaut ! Tybalde aleator ! vieil imbécile ! vieux joueur !</p><br />
  
  <p className="text-justify mb-4">— Dieu vous garde ! avez-vous fait souvent double-six cette nuit ?</p><br />
  
  <p className="text-justify mb-4">— Oh ! la caduque figure, plombée, tirée et battue pour l''amour du jeu et des dés !</p><br />
  
  <p className="text-justify mb-4">— Où allez-vous comme cela, Tybalde ad dados, tournant le dos à l''Université et trottant vers la Ville ?</p><br />
  
  <p className="text-justify mb-4">— Il va sans doute chercher un logis rue Thibautodé, cria Jehan du Moulin.</p><br />
  
  <p className="text-justify mb-4">Toute la bande répéta le quolibet avec une voix de tonnerre et des battements de mains furieux.</p><br />
  
  <p className="text-justify mb-4">— Vous allez chercher logis rue Thibautodé, n''est-ce pas, monsieur le recteur, joueur de la partie du diable ?</p><br />
  
  <p className="text-justify mb-4">Puis ce fut le tour des autres dignitaires.</p><br />
  
  <p className="text-justify mb-4">— À bas les bedeaux ! à bas les massiers !</p><br />
  
  <p className="text-justify mb-4">— Dis donc, Robin Poussepain, qu''est-ce que c''est donc que celui-là ?</p><br />
  
  <p className="text-justify mb-4">— C''est Gilbert de Suilly, Gilbertus de Soliaco, le chancelier du collège d''Autun.</p><br />
  
  <p className="text-justify mb-4">— Tiens, voici mon soulier : tu es mieux placé que moi ; jette-le-lui par la figure.</p><br />
  
  <p className="text-justify mb-4">— Saturnalitias mittimus ecce nuces.</p><br />
  
  <p className="text-justify mb-4">— À bas les six théologiens avec leurs surplis blancs !</p><br />
  
  <p className="text-justify mb-4">— Ce sont là les théologiens ? Je croyais que c''étaient les six oies blanches données par Sainte-Geneviève à la ville, pour le fief de Roogny.</p><br />
  
  <p className="text-justify mb-4">— À bas les médecins !</p><br />
  
  <p className="text-justify mb-4">— À bas les disputations cardinales et quodlibétaires !</p><br />
  
  <p className="text-justify mb-4">— À toi ma coiffe, chancelier de Sainte-Geneviève ! tu m''as fait un passe-droit. — C''est vrai cela ! il a donné ma place dans la nation de Normandie au 
  petit Ascanio Falzaspada, qui est de la province de Bourges, puisqu''il est Italien </p><br />
  
  <p className="text-justify mb-4">— C''est une injustice, dirent tous les écoliers. À bas le chancelier de Sainte-Geneviève !</p><br />
  
  <p className="text-justify mb-4">— Ho hé ! maître Joachim de Ladehors ! Ho hé ! Louis Dahuille ! Ho hé ! Lambert Hoctement !</p><br />
  
  <p className="text-justify mb-4">— Que le diable étouffe le procureur de la nation d''Allemagne !</p><br />
  
  <p className="text-justify mb-4">— Et les chapelains de la Sainte-Chapelle, avec leurs aumusses grises ; cum tunicis grisis !</p><br />
  
  <p className="text-justify mb-4">— Seu de pellibus grisis fourratis !</p><br />
  
  <p className="text-justify mb-4">— Holàhée ! les maîtres ès arts ! Toutes les belles chapes noires ! toutes les belles chapes rouges !</p><br />
  
  <p className="text-justify mb-4">— Cela fait une belle queue au recteur.</p><br />
  
  <p className="text-justify mb-4">— On dirait un duc de Venise qui va aux épousailles de la mer.</p><br />
  
  <p className="text-justify mb-4">— Dis donc, Jehan ! les chanoines de Sainte-Geneviève !</p><br />
  
  <p className="text-justify mb-4">— Au diable la chanoinerie !</p><br />
  
  <p className="text-justify mb-4">— Abbé Claude Choart ! docteur Claude Choart ! Est-ce que vous cherchez Marie la Giffarde ?</p><br />
  
  <p className="text-justify mb-4">— Elle est rue de Glatigny.</p><br />
  
  <p className="text-justify mb-4">— Elle fait le lit du roi des ribauds.</p><br />
  
  <p className="text-justify mb-4">— Elle paie ses quatre deniers ; quatuor denarios.</p><br />
  
  <p className="text-justify mb-4">— Aut unum bombum.</p><br />
  
  <p className="text-justify mb-4">— Voulez-vous qu''elle vous paye au nez ?</p><br />
  
  <p className="text-justify mb-4">— Camarades ! maître Simon Sanguin, l''électeur de Picardie, qui a sa femme en croupe.</p><br />
  
  <p className="text-justify mb-4">— Post equitem sedet atra cura.</p><br />
  
  <p className="text-justify mb-4">— Hardi, maître Simon !</p><br />
  
  <p className="text-justify mb-4">— Bonjour, monsieur l''électeur !</p><br />
  
  <p className="text-justify mb-4">— Bonne nuit, madame l''électrice !</p><br />
  
  <p className="text-justify mb-4">— Sont-ils heureux de voir tout cela, disait en soupirant Joannes de Molendino, toujours perché dans les feuillages de son chapiteau.</p><br />
  
  <p className="text-justify mb-4">Cependant le libraire juré de l''Université, maître Andry Musnier, se penchait à l''oreille du pelletier-fourreur des robes du roi, maître Gilles Lecornu.</p><br />
  
  <p className="text-justify mb-4">— Je vous le dis, monsieur, c''est la fin du monde. On n''a jamais vu pareils débordements de l''écolerie. Ce sont les maudites inventions du siècle qui 
  perdent tout. Les artilleries, les serpentines, les bombardes, et surtout l''impression, cette autre peste d''Allemagne. Plus de manuscrits, plus de livres ! 
  L''impression tue la librairie. C''est la fin du monde qui vient.</p><br />
  
  <p className="text-justify mb-4">— Je m''en aperçois bien aux progrès des étoffes de velours, dit le marchand fourreur.</p><br />
  
  <p className="text-justify mb-4">En ce moment midi sonna.</p><br />
  
  <p className="text-justify mb-4">— Ha !… dit toute la foule d''une seule voix. Les écoliers se turent. Puis il se fit un grand remue-ménage, un grand mouvement de pieds et de têtes, une grande 
  détonation générale de toux et de mouchoirs ; chacun s''arrangea, se posta, se haussa, se groupa ; puis un grand silence ; tous les cous restèrent tendus, toutes 
  les bouches ouvertes, tous les regards tournés vers la table de marbre. Rien n''y parut. Les quatre sergents du bailli étaient toujours là, roides et immobiles 
  comme quatre statues peintes. Tous les yeux se tournèrent vers l''estrade réservée aux envoyés flamands. La porte restait fermée, et l''estrade vide. 
  Cette foule attendait depuis le matin trois choses : midi, l''ambassade de Flandre, le mystère. Midi seul était arrivé à l''heure.</p><br />
  
  <p className="text-justify mb-4">Pour le coup c''était trop fort.</p><br />
  
  <p className="text-justify mb-4">On attendit une, deux, trois, cinq minutes, un quart d''heure ; rien ne venait. L''estrade demeurait déserte, le théâtre muet. Cependant à l''impatience 
  avait succédé la colère. Les paroles irritées circulaient, à voix basse encore, il est vrai. — Le mystère ! le mystère ! murmurait-on sourdement. 
  Les têtes fermentaient. Une tempête, qui ne faisait encore que gronder, flottait à la surface de cette foule. Ce fut Jehan du Moulin qui en tira la première étincelle.</p><br />
  
  <p className="text-justify mb-4">— Le mystère, et au diable les flamands ! s''écria-t-il de toute la force de ses poumons, en se tordant comme un serpent autour de son chapiteau.</p><br />
  
  <p className="text-justify mb-4">La foule battit des mains.</p><br />
  
  <p className="text-justify mb-4">— Le mystère, répéta-t-elle, et la Flandre à tous les diables !</p><br />
  
  <p className="text-justify mb-4">— Il nous faut le mystère, sur-le-champ, reprit l''écolier ; ou m''est avis que nous pendions le bailli du Palais, en guise de comédie et de moralité.</p><br />
  
  <p className="text-justify mb-4">— Bien dit, cria le peuple, et entamons la pendaison par ses sergents.</p><br />
  
  <p className="text-justify mb-4">Une grande acclamation suivit. Les quatre pauvres diables commençaient à pâlir et à s''entre-regarder. La multitude s''ébranlait vers eux, et ils voyaient 
  déjà la frêle balustrade de bois qui les en séparait ployer et faire ventre sous la pression de la foule.</p><br />
  
  <p className="text-justify mb-4">Le moment était critique.</p><br />
  
  <p className="text-justify mb-4">— À sac ! à sac ! criait-on de toutes parts.</p><br />
  
  <p className="text-justify mb-4">En cet instant, la tapisserie du vestiaire que nous avons décrit plus haut se souleva, et donna passage à un personnage dont la seule vue arrêta subitement la foule, et changea comme par enchantement sa colère en curiosité.</p><br />
  
  <p className="text-justify mb-4">— Silence ! silence !</p><br />
  
  <p className="text-justify mb-4">Le personnage, fort peu rassuré et tremblant de tous ses membres, s''avança jusqu''au bord de la table de marbre, avec force révérences qui, à mesure qu''il approchait, ressemblaient de plus en plus à des génuflexions.</p><br />
  
  <p className="text-justify mb-4">Cependant le calme s''était peu à peu rétabli. Il ne restait plus que cette légère rumeur qui se dégage toujours du silence de la foule.</p><br />
  
  <p className="text-justify mb-4">— Messieurs les bourgeois, dit-il, et mesdemoiselles les bourgeoises, nous devons avoir l''honneur de déclamer et représenter devant son éminence 
  M. le cardinal une très belle moralité, qui a nom : Le bon jugement de madame la vierge Marie. C''est moi qui fais Jupiter. Son éminence accompagne en ce 
  moment l''ambassade très honorable de monsieur le duc d''Autriche ; laquelle est retenue, à l''heure qu''il est, à écouter la harangue de M. le recteur de 
  l''Université, à la Porte Baudets. Dès que l''éminentissime cardinal sera arrivé, nous commencerons.</p><br />
  
  <p className="text-justify mb-4">Il est certain qu''il ne fallait rien moins que l''intervention de Jupiter pour sauver les quatre malheureux sergents du bailli du Palais. Si nous avions 
  le bonheur d''avoir inventé cette très véridique histoire, et par conséquent d''en être responsable par-devant Notre-Dame la Critique, ce n''est pas contre nous 
  qu''on pourrait invoquer en ce moment le précepte classique : Nec deus intersit. Du reste, le costume du seigneur Jupiter était fort beau, et n''avait pas peu 
  contribué à calmer la foule en attirant toute son attention. Jupiter était vêtu d''une brigandine couverte de velours noir, à clous dorés ; il était coiffé 
  d''un bicoquet garni de boutons d''argent dorés ; et, n''était le rouge et la grosse barbe qui couvraient chacun une moitié de son visage, n''était le rouleau 
  de carton doré, semé de passequilles et tout hérissé de lanières de clinquant qu''il portait à la main et dans lequel des yeux exercés reconnaissaient aisément 
  la foudre, n''était ses pieds couleur de chair et enrubannés à la grecque, il eût pu supporter la comparaison, pour la sévérité de sa tenue, avec un archer 
  breton du corps de monsieur de Berry.</p><br />
  '
  ),


  ('Structure and Interpretation of Computer Programs', 

  'Abelson & Sussman', 

  'Manuel fondamental du MIT sur les fondements de l''informatique, mettant l''accent sur la programmation fonctionnelle et la construction d''interpréteurs.', 

  'Informatique', 

  true, 

  'https://i.imgur.com/8Wti6Xj.jpg', 

  7,

  '<h2>Unofficial Texinfo Format</h2>
  
  <p className="text-justify mb-4">This is the second edition sicp book, from Unofficial Texinfo Format. You are probably reading it in an Info hypertext browser, such as the Info mode of Emacs. 
  You might alternatively be reading it TEX-formatted on your screen or printer, though that would be silly. And, if printed, expensive.</p><br />
  
  <p className="text-justify mb-4">The freely-distributed official Hrmi-and-ciF format was first converted personally to Unofficial Texinfo Format (UTF) version 1 by Lytha Ayth during a long Emacs lovefest weekend in April, 2001.</p><br />
  
  <p className="text-justify mb-4">The uTF is easier to search than the HTML format. It is also much more accessible to people running on modest computers, such as donated °386-based PCs. 
  A 386 can, in theory, run Linux, Emacs, and a Scheme interpreter simultaneously, but most 386s probably can''t also run both Netscape and the necessary X Window 
  System without prematurely introducing budding young underfunded hackers to the concept of thrashing. UTF can also fit uncompressed on a 1.44MB floppy diskette, 
  which may come in handy for installing uTF on PCs that do not have Internet or LAN access.</p><br />
  
  <p className="text-justify mb-4">The Texinfo conversion has been a straight transliteration, to the extent possible. Like the TEX-to-HTML conversion, this was not without some introduction 
  of breakage. In the case of Unofficial Texinfo Format, the breakage is mostly in the form of Texinfo markup that is not supported by the Info browser. 
  This includes, for example, the Texinfo @-commands for creating a table of contents. The uTF version does not have a table of contents, but it does have a 
  list of all the chapters and sections in the book.</p><br />
  ',
  
  '<p className="text-justify mb-4">contenu_a_mettre</p><br />
  '
  ),



  ('Think Python', 

  'Allen B. Downey', 

  'Introduction à la programmation en Python, abordant les concepts fondamentaux de la programmation et de la pensée algorithmique.', 

  'Informatique', 

  true, 

  'https://i.imgur.com/Euj5L6k.jpg', 

  7,

  '<h2>The strange history of this book</h2>
  
  <p className="text-justify mb-4">In January 1999 I was preparing to teach an introductory programming class in Java. I had taught it three times and I was getting frustrated. 
  The failure rate in the class was too high and, even for students who succeeded, the overall level of achievement was too low.</p><br />
  
  <p className="text-justify mb-4">One of the problems I saw was the books. They were too big, with too much unnecessary detail about Java, and not enough high-level guidance about how to program. 
  And they all suffered from the trap door effect: they would start out easy, proceed gradually, and then somewhere around Chapter 5 the bottom would fall out. 
  The students would get too much new material, too fast, and I would spend the rest of the semester picking up the pieces.</p><br />
  
  <p className="text-justify mb-4">Two weeks before the first day of classes, I decided to write my own book. My goals were:</p><br />
  <ul>
      <li>Keep it short. It is better for students to read 10 pages than not read 50 pages.</li>
      <li>Be careful with vocabulary. I tried to minimize the jargon and define each term at first use.</li>
      <li>Build gradually. To avoid trap doors, I took the most difficult topics and split them into a series of small steps.</li>
      <li>Focus on programming, not the programming language. I included the minimum useful subset of Java and left out the rest.</li>
  </ul>
  ',
  
  '<p className="text-justify mb-4">contenu_a_mettre</p><br />'
  ),



  ('Open Data Structures', 

  'Pat Morin', 

  'Livre pédagogique sur les structures de données modernes, accessible et axé sur les performances, avec du code en Java, C++ et pseudocode.', 

  'Algorithmique', 

  true, 

  'https://i.imgur.com/uBUU8mL.jpg', 

  7,

  '<h2>Why This Book?</h2>
  
  <p className="text-justify mb-4">There are plenty of books that teach introductory data structures. Some of them are very good. Most of them cost money and the vast majority of computer 
  science undergraduate students will shell-out at least some cash on a data structures book</p><br />
  
  <p className="text-justify mb-4">There are a few free data structures books available online. Some are very good, but most of them are getting old. The majority of these books became 
  free when the author and/or publisher decided to stop updating them. Updating these books is usually not possible, for two reasons: (1) The copyright belongs 
  to the author or publisher, who may not allow it. (2) The source code for these books is often not available. That is, the Word, WordPerfect, FrameMaker, 
  or MpX source for the book is not available, and the version of the software that handles this source may not even be available.</p><br />
  
  <p className="text-justify mb-4">The goal of this project is to forever free undergraduate computer science students from having to pay for an introductory data structures book. 
  I have decided to implement this goal by treating this book like an Open Source software project. The MpX source, Java source, and build scripts for the book 
  are available for download on the book''s website (opendatastructures.org) and also — more importantly — on a reliable source code management 
  site (https://github.com/patmorin/ods).</p><br />
  
  <p className="text-justify mb-4">This source code is released under a Creative Commons Attribution license, meaning that anyone is free to use it, modify it, and redistribute it, as long 
  as they give credit to the original author. The source code is also released under the GNU General Public License (GPL), meaning that anyone is free to use it, 
  modify it, and redistribute it, as long as they give credit to the original author and make their modifications available under the same license.</p><br />
  
  <ul>
    <li>to Share — to copy, distribute and transmit the work; and</li>
    <li>to Remix — to adapt the work.</li>
  </ul>
  
  <p className="text-justify mb-4">This includes the right to make commercial use of the work. The only condition on these rights is</p><br />
  
  <ul><li>Attribution — You must attribute the work by displaying a notice stating the derived work contains code and/or text from the Open Data Structures 
  Project and/or linking to opendatastructures.org.</li></ul>
  ',

  '<p className="text-justify mb-4">contenu_a_mettre</p><br />
  '
  ),



  ('Mathematics for Computer Science', 

  'Eric Lehman, F. Thomson Leighton', 

  'Cours complet sur les mathématiques discrètes appliquées à l''informatique : logique, graphes, combinatoire, probabilités, induction.', 

  'Mathématiques', 

  true, 

  'https://i.imgur.com/NoHpYd7.jpg', 

  7,

  '<h2>INTRODUCTION</h2>
  <p className="text-justify mb-4">This text explains how to use mathematical models and methods to analyze prob¬ lems that arise in computer science. The notion of a proof plays a central role in this work.</p><br />
  
  <p className="text-justify mb-4">Simply put, a proof is a method of establishing truth. Like beauty, “truth” some¬ times depends on the eye of the beholder, and it should not be surprising 
  that what constitutes a proof differs among fields. For example, in the judicial system, legal truth is decided by a jury based on the allowable evidence presented 
  at trial. In the business world, authoritative truth is specified by a trusted person or organization, or maybe just your boss. In fields such as physics 
  and biology, scientific truth 1 is confirmed by experiment. In statistics, probable truth is established by statistical analysis of sample data.</p><br />
  
  <p className="text-justify mb-4">Philosophical proof involves careful exposition and persuasion typically based on a series of small, plausible arguments. The best example begins with 
  “Cogito ergo sum,” a Latin sentence that translates as “I think, therefore I am.” It comes from the beginning of a 17th century essay by the 
  mathematician/philosopher, Rene Descartes, and it is one of the most famous quotes in the world: do a web search on the phrase and you will be flooded with hits.</p><br />
  
  <p className="text-justify mb-4">Deducing your existence from the fact that you''re thinking about your existence is a pretty cool and persuasive-sounding idea. Flowever, with just a few more 
  lines of argument in this vein, Descartes goes on to conclude that there is an infinitely beneficent God. Whether or not you believe in a beneficent God, you''ll 
  probably agree that any very short proof of God''s existence is bound to be far-fetched. So</p><br />
  
  ',
  
  '<p className="text-justify mb-4">contenu_a_mettre</p><br />
  '
  
  ),



  ('Deep Learning', 

  'Ian Goodfellow, Yoshua Bengio, Aaron Courville', 

  'Référence académique sur le deep learning, couvrant les bases mathématiques, les réseaux neuronaux, l''optimisation, et les applications avancées.', 

  'Intelligence Artificielle', 

  true, 

  'https://i.imgur.com/z7goq8I.jpg', 

  7,

  '<h2>DEEP LEARNING</h2>
  
  <p className="text-justify mb-4">Deep Learning provides a truly comprehensive look at the state of the art in deeplearning and some developing areas of research. The authors are Ian Goodfellow,
  along with his Ph.D. advisor Yoshua Bengio, and Aaron Courville. All three arewidely published experts in the ﬁeld of artiﬁcial intelligence (AI). In addition 
  tobeing available in both hard cover and Kindle the authors also make the individualchapter PDFs available for free on the Internet.1The book is aimed at an 
  academicresearch audience with prior knowledge of calculus, linear algebra, probability, andsome programming capabilities. A non-mathematical reader will ﬁnd 
  this bookdifﬁcult. A comprehensive, well cited coverage of the ﬁeld makes this book avaluable reference for any researcher. The book provides a mathematical 
  description of a comprehensive set of deep learning algorithms, but could beneﬁtfrom more pseudocode examples. The authors provide an adequate explanation for 
  the many mathematical formulas that are used to communicate the ideas expressedin this book. The lack of both exercises and examples in any of the major machine
  learning software packages makes this book difﬁcult as a primary undergraduatetextbook.</p><br />
  
  <p className="text-justify mb-4">While a review of a book focused entirely on deep learning might not be theusual topic for Genetic Programming and Evolvable Machines, there are many areasof 
  interest for the genetic programming (GP) and evolutionary algorithm researchcommunities. The effect of deep learning upon the ﬁeld of AI has been profound.
  Deep learning''s application to diverse cases ranging from self-driving cars to thegame of Go have been widely reported. This book provides a solid deep learning</p><br />
  ',

  '<p className="text-justify mb-4">contenu_a_mettre</p><br />
  '
  );



-- Insérer des emprunts
INSERT INTO "emprunts" ("utilisateur_id", "livre_id", "date_emprunt", "date_retour", "rendu")
VALUES
  (2, 1, '2025-04-13', '2025-04-20', false),
  (2, 2, '2025-04-13', NULL , true);



-- Insérer des avis
INSERT INTO "avis" ("utilisateur_id", "livre_id", "commentaire", "note" )
VALUES 
(2, 1, 'Magnifique histoire, très poétique.', 5),
(2, 2, 'Très profond, mais un peu étrange imisbrah.', 4);



COMMIT;
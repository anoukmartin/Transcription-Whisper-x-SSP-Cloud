![](images/Untitled.svg)

# Transcription d'entretiens avec Whisper et le SSP Cloud

Ce tutoriel cherche à proposer une **solution simple et rapide aux personnes souhaitant retranscrire des enregistrements audio grâce au module [Whisper](https://github.com/openai/whisper) de [OpenAI](https://openai.com/) qui ne nécessite ni l'installation de logiciel, ni de disposer d'un ordinateur puissant, ni une bonne connaissance de Python et Bash**. Il ne présente pas toutes les potentialités de Whisper. Les informations complètes sur toutes ces fonctionnalités sont disponibles sur le dépôt [Github d'OpenAi](https://github.com/openai/whisper/blob/main/README.md). Par ailleurs, **la retranscription automatisée d'entretiens sociologiques avec WhisperOpenAI soulève un certain nombre de questions très bien évoquées par Yacine Ichtour dans [ce tutoriel](https://www.css.cnrs.fr/whisper-pour-retranscrire-des-entretiens/) dont je recommande vivement la lecture.**

L'utilisation de Whisper en local pour la transcription de fichiers audio aussi longs que des entretiens sociologiques nécessite de disposer d'un ordinateur puissant (c'est-à-dire avec un CPU rapide voir un GPU, ce dont la plus part des étudiant.e.s ne disposent pas) pour pouvoir utiliser le modèle de transcription le plus précis (et donc le plus lent !) sans y passer deux jours. C'est pourquoi il peut être nécessaire d'utiliser un service de calcul en ligne dont l'accès n'est pas toujours libre comme dans le cas d'[HumaNum](https://documentation.huma-num.fr/calcul-scientifique/) ou qui posent de sérieux problèmes en matière de récolte des données personnelles comme dans le cas de [Google Colab](https://colab.research.google.com/drive/1srjHp_YjsXr92fNBsYIm3plG9sUoVKy7?usp=sharing). La solution proposée ici s'appuie sur l'application web [Onyxia](https://github.com/InseeFrLab/onyxia-web/blob/main/README.md) développé le Service Statistique Public qui associe plusieurs technologies open source pour fournir un environnement de travail aux statisticiens.

## Une grosse puissance de calcul en accès (presque) libre

Onyxia propose un datalab, service de calcul en ligne du [SSP Cloud](https://github.com/InseeFrLab/onyxia-web/blob/main/README.md), développé par l'INSEE et la Direction Interministérielle du Numérique (DINUM) qui permet l'émulation en ligne d'applications comme Rstudio, Jupyter et Vscode et met à disposition des ressources (CPU, GPU et RAM) permettant ainsi d'accélérer grandement la vitesse de calcul[^readme-1]. En d'autre termes, l'utilisation du datalab du SSP Cloud permet de retranscrire des entretiens rapidement et précisément tout en continuant d'utiliser son ordinateur normalement pendant que cette tache s'effectue (puisque les ressources locales ne sont pas utilisées). Ainsi, avec le modèle de transcription le plus lourd et précis, la durée de transcription est proche de celle de l'enregistrement (par exemple 2h d'entretien seront transcrites en 2h par Whisper), on a donc des performances similaires à celles observées avec Google Collab.

[^readme-1]: L'émulation sur le datalab permet ainsi une utilisation de Rstudio qui ne nécessite pas d'installation de logiciels (ni R ni Rstudio), reste à jour, dont la puissance de calcul en général meilleure que celle des ordinateurs personnels. Elle permet aussi la pré-configuration et le partage de ces services, ce qui peut être particulièrement utile dans un cadre de travail collectif ou pour l'enseignement des méthodes quantitatives. A ce titre, l'utilisation des services du SSP Cloud pourrait intéresser bon nombre d'étudiant.e.s, d'enseigant.e.s et de chercheur.euse.s. Il est cependant conseillé de maîtriser les bases de l'utilisation de [Git](https://git-scm.com/).

L'utilisation du datalab du SSP Cloud est gratuite, cependant elle nécessite la création d'un compte. A l'origine destiné aux statisticiens des services de l'Etat, le SSP Cloud est cependant ouvert à la majorité des étudiant.e.s, enseignant.e.s et chercheur.euse.s via leur adresse mail institutionnelle[^readme-2].

[^readme-2]: liste des domaines autorisés : *insee.fr, gouv.fr, mnhn.fr, polytechnique.edu, ensae.fr, groupe-genes.fr, ensai.fr, sncf.fr, imf.org, veltys.com, unedic.fr, ined.fr, centralesupelec.fr, student-cs.fr, student.ecp.fr, supelec.fr, ign.fr, has-sante.fr, casd.eu, datastorm.fr, framatome.com, ars.sante.fr, ansm.sante.fr, cnaf.fr, ac-lille.fr, ac-amiens.fr, ac-normandie.fr, ac-reims.fr, ac-nancy-metz.fr, ac-strasbourg.fr, ac-creteil.fr, ac-paris.fr, nantesmetropole.fr, ac-versailles.fr, ac-rennes.fr, ac-nantes.fr, ac-orleans-tours.fr, ac-dijon.fr, ac-besancon.fr, ac-poitiers.fr, ac-limoges.fr, ac-clermont.fr, ac-lyon.fr, ac-grenoble.fr, ac-bordeaux.fr, ac-toulouse.fr, ac-montpellier.fr, ac-aix-marseille.fr, ac-nice.fr, ac-corse.fr, ac-martinique.fr, ac-guadeloupe.fr, ac-reunion.fr, ac-guyane.fr, ac-mayotte.fr, ac-wf.wf, monvr.pf, anfr.fr, ccomptes.fr, ac-noumea.nc, ac-spm.fr, inrae.fr, inria.fr, irsn.fr, ird.fr, arcep.fr, assemblee-nationale.fr, hceres.fr, ext.ec.europa.eu, health-data-hub.fr, datactivist.coop, inpi.fr, telecom-paris.fr, ineris.fr, cerema.fr, cnrs.fr, univ-rouen.fr, univ-paris1.fr, etu.univ-paris1.fr, edu.univ-paris1.fr, ens-paris-saclay.fr, ens.fr, ens-lyon.fr, cereq.fr, univ-eiffel.fr, chu-toulouse.fr, atih.sante.fr, thinkr.fr, inserm.fr, i-carre.net, statcan.gc.ca, istat.it, scb.se, ine.pt, oecd.org, etu.unicaen.fr, etu.u-bordeaux.fr, cor-retraites.fr, octo.com, parisnanterre.fr, ssc-spc.gc.ca, ens.fr, enssat.fr, estaca.eu, epitech.digital, ensta-bretagne.org, epitech.eu, epita.fr, lepont-learning.com, student.42.fr, edu.devinci.fr, cy-tech.fr, campus-eni.fr, insa-cvl.fr, student.wat.edu.pl, etud.univ-ubs.fr, etu.uca.fr, etudiant.univ-rennes1.fr, eleve.isep.fr, irisa.fr, sciencespo.fr, insa-rennes.fr, edu.univ-paris13.fr, ull.edu.es, toulouse-metropole.fr, acoss.fr, huma-num.fr, outscale.com, ademe.fr, santepubliquefrance.fr, irit.fr, prestataire.finances.gouv.fr, ensea.ed.ci, insse.ro, thalesgroup.com, giskard.ai, nextmap.io, adullact.org, mithrilsecurity.io, ip-paris.fr, normandie.fr, u-paris.fr, elysee.fr, univ-cotedazur.fr, bceao.int, renater.fr, assurance-maladie.fr, cnes.fr, ecb.europa.eu, ecb.int, esiea.fr, institut-agro.fr, agrosupdijon.fr, ins.tn, mercator-ocean.fr, hcp.ma, pole-emploi.fr, making-sense.info, seenovate.com, quantstack.net, cartes-bancaires.com, paris.fr, agglo-pau.fr, ehesp.fr, statistics.gov.rw, ec.europa.eu, crtc.ccomptes.fr, vlaanderen.be, caissedesdepots.fr, banque-france.fr, economie.fgov.be, odeadom.fr, justice.fr, ensma.fr, in2p3.fr, adaltas.com, stat.fi, ssb.no, cbs.nl, ine.es, statistik.gv.at, cso.ie, epfl.ch, sdsc.ethz.ch, switch.ch, ensea.fr, cyu.fr, cbs.nl, unige.ch, vlaanderen.be, ons.gov.uk, sdsc.ethz.ch, ilo.org, uchicago.edu, ncsi.gov.om, un.org, oecd.org, ext.st, ine.pt)atec.etat.lu, gov.si, stat.ee, epfl.ch, ifrc.org, ine.es, ssb.no, gtu.ge, ine.pt, bfs.admin.ch, bis.org, destatis.de, bsp.gov.ph, pg.com, afd.fr, isere.fr, chambagri.fr, chu-reunion.fr, afristat.org, citeos.com, agglo-larochelle.fr, insd.bf, stat.gov.pl, stats.govt.nz, nbb.be, statec.etat.lu*

## Une meilleure (mais pas parfaite) protection des données

Si Google Colab pose d'évidents problèmes avec le RGPD, l'utilisation du datalab n'est pas non plus exempt de limites en matière de protection des données. En particulier le système de stockage du SSP Cloud ne peut pas garantir la confidentialité des données stockées sur celui-ci. Cependant avec la méthode proposée ici, l'enregistrement audio et sa transcription sous la forme de texte ne sont pas chargés dans le système de stockage du SSP Cloud mais seulement dans la mémoire temporaire d'un service dont la suppression est possible après chaque utilisation et est automatique après 24h, limitant de ce fait les risques de divulgation. **En cas d'informations très sensibles contenues dans vos enregistrements, il reste préférable d'utiliser une autre solution (comme la retranscription à la main).**

# Tutoriel

## Préalable : Disposer d'un compte SSP Cloud

Si vous n'en avez pas, vous devez [créer un compte](https://auth.lab.sspcloud.fr/auth/realms/sspcloud/login-actions/registration?client_id=onyxia&tab_id=VHXwOvcjkjQ).

## Etape 1 : Lancer Python préconfiguré pour Whisper

Dans l'environnement de travail du SSP Cloud, il est possible de lancer Python directement via l'onglet "Catalogue de services" en choisissant jupyter-python-gpu puis en réalisant "à la main" la configuration du service et enfin en installant Whisper et ses dépendances.

Vous pouvez plus simplement lancer python en suivant ce lien : [lancer python préconfiguré pour Whisper](https://datalab.sspcloud.fr/launcher/ide/jupyter-python-gpu?autoLaunch=true&onyxia.friendlyName=«Transcription%20Whisper»&resources.limits.cpu=«40000m»&resources.limits.nvidia.com/gpu=«4»&resources.limits.memory=«198Gi»&init.personalInit=«https%3A%2F%2Fraw.githubusercontent.com%2Fanoukmartin%2FTranscription-Whisper-x-SSP-Cloud%2Fmain%2FInitPy.sh»). Dans ce cas, un nouveau service nommé ![](images/Capture3.PNG){width="158"} apparaît dans l'onglet ![](images/Capture2.PNG){width="120" height="30"} de votre compte SSP Cloud. Ce service est pré-configuré pour que l'utilisation de Whisper y soit facile[^readme-3].

[^readme-3]: Ce service est préconfiguré de sorte à obtenir l'assistance d'un GPU et à disposer du maximum de ressources possible en CPU et mémoire vive en cas de besoin. L'installation de whisper et de ffmpeg se fait automatiquement lors du lancement du service. Les informations précises sur ces réglages sont disponibles en cliquant sur ![](images/Capture4.PNG) une fois que le service est prêt.

Une fois que ce service est prêt (cela peut prendre un peu de temps car le chargement de Whisper est long) pour l'ouvrir, cliquer sur le bouton ![](images/Capture5.PNG){width="67"}. Une boite de dialogue s'ouvre. Cliquer sur ![](images/Capture6.PNG){width="231"} puis sur ![](images/Capture7.PNG){width="242"}. Une page s'ouvre. Coller le mot de passe dans le champ destiné pour se connecter ![](images/Capture8.PNG){width="234"} .

## Etape 2 : Transcrire un fichier audio

Une fois le service lancé, l'interface Jupyter s'ouvre :

![](images/Capture10.PNG)

### 1. Charger votre fichier audio

En utilisant le bouton ![](images/Capture11.PNG){width="36"}, charger le(s) fichier(s) audio à retranscrire. Celui doit être au format .mp3 ou .wav. Si votre fichier est volumineux ou que vous souhaiter en charger plusieurs, il est préférable de disposer d'une bonne connexion à internet.

### 2. Ouvrez un Notebook Python

Dans la partie droite de l'écran, cliquer sur le bouton ![](images/Capture12.PNG){width="29" height="30"} de l'onglet Notebook. Un Notebook s'ouvre alors :

![](images/Capture13.PNG)

### 3. Demander à Whisper de retranscrire l'audio

Dans le Notebook écrire la ligne de code suivante, en remplaçant "mon_enregistement_audio" par son nom.

``` python
!whisper "mon_enregistement_audio" --model large-v2 --language French
```

Un exemple avec l'enregistrement audio de la chanson de [Meryl, *AHLALA*](https://www.youtube.com/watch?v=XfIefINb84U&ab_channel=FIYAHRECORDS).

![](images/Capture14%20(2).PNG)

Puis exécuter cette ligne de code grâce au bouton ![](images/Capture15.PNG). Le chargement du modèle commence. Une fois effectué, la transcription de l'audio démarre. Lorsque celle-ci est finie, plusieurs fichiers apparaissent dans la partie gauche de l'écran. Ils portent tous le nom de votre audio et sont de formats différents. Le fichier de format texte (.txt) contient la transcription de l'enregistrement.

![](images/Capture17.PNG)

## 4. Télécharger la transcription du fichier audio

Pour télécharger le fichier texte : clic droit sur celui-ci \> download

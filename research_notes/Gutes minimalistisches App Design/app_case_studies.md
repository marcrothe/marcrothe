# App Case Studies: Collections, Achievements and Personal History (lessons for a minimalist race-bib collection iPhone app)

Research date: 2026-10-09. Method note: the web-fetch tool could not resolve most primary domains (strava.com, letterboxd.com, apple.com, duolingo.com, pokemon.co.jp, apps.apple.com) in this session, so findings rely on search-result extracts of those pages plus secondary press. Where a claim comes only from secondary or low-authority sources, this is flagged. Older sources are dated inline.

---

## Q1: How is the collection displayed (grid, stack, list, 3D)? How are favorites and highlights shown?

### Takeaway
The best-regarded apps show a **small curated highlight on the profile** (Strava: 4 newest badges; Letterboxd: "four favorites"; Apple Fitness: top 3 most relevant awards) with the **full collection one tap away** in a grid, and give individual items **object-like presence** (Apple's rotatable 3D medals with your name engraved on the back, TCG Pocket's tilt-to-shimmer cards, Wallet's stacked cards). No existing app is dedicated to collecting race bibs; the nearest products are small, new medal-catalogue apps.

### Cited Findings

**Strava (Trophy Case)**
- The Trophy Case collects all completed challenge badges on one page; the **four newest badges appear on the profile**, with the full collection one tap away. On mobile you reach it via profile picture → "All trophies", and tapping a badge opens its challenge details — [Strava Help: The Strava Trophy Case](https://support.strava.com/en-us/articles/15402068-the-strava-trophy-case); [older version](https://support.strava.com/hc/en-us/articles/216918557-The-Strava-Trophy-Case)
- Challenges without a single distance goal (e.g. Monthly Training Series) do not appear until the final milestone is reached — [Strava Help](https://support.strava.com/en-us/articles/15402068-the-strava-trophy-case)
- Badge designs and brand rewards have become a major draw for challenges (Strava community post, 2023) — [Strava Community Hub](https://communityhub.strava.com/insider-journal-9/down-strava-challenges-memory-lane-1569)
- Local Legends (launched 2020) gives a "Laurel Crown" to whoever has the **most efforts on a segment in a rolling 90-day window**, measuring consistency rather than speed. A histogram shows how far your count is from the leader's. Achievements show in the feed, on the activity detail page and in segment results — [DC Rainmaker](https://dcrainmaker.com/2020/06/strava-legends-feature.html); [BikeRadar](https://www.bikeradar.com/news/strava-local-legend/); [Bikerumor](https://bikerumor.com/new-strava-local-legends-feature-gives-you-a-trophy-just-for-showing-up)

**Apple Fitness / Activity awards**
- All achievements earn **3D medals**, viewable in the Achievements/Awards area of the iPhone Activity (now Fitness) app — [9to5Mac (2021)](https://9to5mac.com/2021/12/13/apple-watch-activity-awards/)
- Selecting an award shows a 3D animation of it, and **spinning it reveals a back side engraved with the wearer's name** ("it's got your name on the back"). This is reported only by iMore, not by Apple documentation — [iMore](https://www.imore.com/how-my-apple-watch-keeps-me-motivated)
- The Veterans Day medal was described as a three-dimensional textured version of its iMessage sticker — [9to5Mac](https://9to5mac.com/2021/12/13/apple-watch-activity-awards/)
- On iPhone (as of the iOS 14 redesign) the Summary tab shows your **top three most relevant awards**. "Show More" opens the full Awards grid, and tapping an award opens its description view. The awards area includes **unearned awards you are still working toward** — [MacStories (iOS 14)](https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/); [Apple Community](https://discussions.apple.com/thread/254465757)
- **Limited-edition awards** are tied to a single day or short window (e.g. Global Running Day 2026: a workout of at least 5K on June 3). 2025 had nine limited-time challenges — [Wareable](https://www.wareable.com/apple/apple-watch-global-running-day-2026-award-details-announcement); [Wareable awards guide](https://www.wareable.com/apple/how-to-view-earn-apple-watch-awards-challenges-badges-achievements)
- watchOS 11.2 / iOS 18.2 added "All Rings Closed" streak awards at 100, 365, 500 and 1,000 days, **earnable retroactively** — [AppleInsider](https://appleinsider.com/articles/25/04/14/earn-rewards-boost-your-health-with-apple-watch-on-april-24)
- Physical demand for the digital designs is strong. Apple gave **physical pins** in stores for Global Close Your Rings Day (24 April 2025), and a third-party company sells enamel magnets of more than 40 award designs — [Apple Newsroom](https://www.apple.com/newsroom/2025/04/get-active-with-apple-watch/); [Tom's Guide](https://www.tomsguide.com/wellness/smartwatches/apple-is-awarding-a-limited-edition-pin-to-celebrate-10-years-of-apple-watch-heres-how-to-get-yours); [MacRumors review](https://www.macrumors.com/review/activity-awards-magnets)

**Apple Wallet**
- In the stack you can select, reorder and pay with cards. Long-press and drag rearranges the stack, and tapping a card opens its details or transactions — [AppCoda tutorial](https://www.appcoda.com/learnswiftui/swiftui-advanced-animations.html); [Pratt IxD critique, Sept 2026](https://ixd.prattsi.org/2026/09/design-critique-apple-wallet-ios/)
- Criticism: nothing clearly marks which card on top is the default, so the critique suggests a "Default" label — [Pratt IxD critique](https://ixd.prattsi.org/2026/09/design-critique-apple-wallet-ios/)
- Common recreations of the pattern: tap fans the stack out, a second tap collapses it, with precise offsets and **staggered spring motion**. Tapping a non-top card brings it forward, and tapping the top card opens its detail — [Framer component](https://www.framer.com/marketplace/components/wallet-card/); [Level Up](https://levelup.gitconnected.com/apple-wallet-animation-in-react-native-2faaf4dd10a4)
- iOS 18 **"poster event tickets"** use a full-bleed background artwork, a primary logo, the event date top right, and venue plus secondary logo in the footer. They add an event guide (venue map, parking, weather, Apple Music playlist). They are NFC-only and backward-compatible — [Passcreator](https://www.passcreator.com/en/solutions/enhanced-event-tickets-in-apple-wallet); [9to5Mac](https://9to5mac.com/2024/10/10/ticketmaster-tickets-apple-wallet-ios-18/)
- At WWDC 2025, poster tickets gained support for multiple upcoming events on one ticket. At WWDC 2026, new layouts and visible "Featured Actions" were announced for iOS 27, including a "Poster Generic" style with a large background image — [Apple WWDC25 video](https://developer.apple.com/videos/play/wwdc2025/202/?time=0); [Passcreator](https://www.passcreator.com/en/blog/apple-wallet-design-update-2026); [PassKit help](https://help.passkit.com/en/articles/16159179-apple-wallet-pass-design-changes-coming-in-ios-27)
- Pass detail pages offer far fewer design options than card detail pages (2021) — [Apple Developer Forums](https://developer.apple.com/forums/thread/682098)

**Letterboxd**
- **Four favorite films** sit on the profile. Members use them freely, for all-time favorites, recent watches or the best four of the year. They are edited from the profile edit screen on web or under Settings in the app — [PopSci](https://www.popsci.com/diy/how-to-use-letterboxd/)
- The Patron tier uses the **first of the four favorites as the profile backdrop**, so the curated highlight becomes the page's visual identity — [AppleVis listing](https://applevis.com/apps/ios/social-networking/letterboxd)
- Logging uses a five-star rating, a heart (like) and a watched "eye". In a 2020 build the heart turned orange, the stars green and the eye green on watched, giving immediate colour feedback — [Pratt IxD critique 2020](https://ixd.prattsi.org/2020/09/design-critique-letterboxd-iphone-app/)
- The diary is a chronological log of watches; public diary pages illustrate it — [example diary](https://letterboxd.com/pbjay/diary/)
- App Store reviewers often call the app clean, modern and easy to use (Substack analysis of reviews) — [Punchamoorthee Substack](https://punchamoorthee.substack.com/p/a-deep-dive-into-letterboxd)
- Criticism: important actions (review, rate, add to list) are hidden behind one icon, and social features are scattered with no obvious entry point (student and freelance critiques) — [Pratt IxD 2026](https://ixd.prattsi.org/2026/09/design-critique-letterboxd-ios-app/); [Contra redesign](https://contra.com/p/6ZPPWlRX-uiux-redesign-for-letterboxd-app)

**Pokémon TCG Pocket**
- Players can **tilt the device to view cards from different angles, simulating holding a real card**. "Immersive Cards" use 3D illustrations with parallax. The stated design goal is to make users feel they are handling and collecting physical cards — [The Pokémon Company corporate](https://corporate.pokemon.co.jp/en/topics/detail/t-28/); [Gematsu](https://gematsu.com/2024/08/pokemon-trading-card-game-pocket-launches-october-30)
- Immersive artwork lets you zoom in to extended artwork beyond the card frame — [Serebii](https://serebii.net:443/tcgpocket)
- The collection is shown in **binders and display boards** "to admire and show off to friends". There are pre-set themed binders (e.g. Eeveelutions), and binder covers are sold in the shop — [Pokemon.com guide](https://www.pokemon.com/us/strategy/a-guide-to-collecting-cards-and-using-wonder-picks-in-pokemon-trading-card-game-pocket)

**NBA Top Shot**
- "Moments" are virtual cards that embed a 15–20 s highlight clip from several camera angles in a package with player stats and 3D animations — [Decrypt](https://decrypt.co/43461/nba-top-shot-crypto-collectibles-experience-launches-public); [LV Sports Biz](https://lvsportsbiz.com/2021/08/10/nba-summer-league-as-innovation-platform-league-trying-out-top-shot-digital-game-moments-and-selling-them-for-5-each/)
- Physical bridge: Infinite Objects sold licensed video frames ($199/$399). Each frame was locked to one moment, sold only to its owner, and carried a QR code and holographic authenticity sticker — [APH Networks](https://www.aphnetworks.com/news/24745-nba-partnering-infinite-objects-put-your-top-shot-nfts-display-irl)

**Untappd**
- The original badge icon set was designed to "encourage users to want to collect and share their achievements". Badges later became promotional vehicles for brewers, pubs and festivals (designer portfolio) — [Coroflot, Leighton Hubbell](https://coroflot.com/leighton_hubbell/Icon-design)

**Race bib, medal and results apps (closest competitors)**
- **No dedicated consumer app for collecting race bibs was found.** Bib-related apps are organizer tools for pickup or check-in (IYR CheckIn, RunSignUp, Ticketbud, Race Roster) or event apps — [IYR CheckIn](https://apps.apple.com/us/app/-/id1454730228); [Ticketbud PR](https://www.streetinsider.com/PRNewswire/Ticketbud+Introduces+Race+Bib+Integration+to+Enhance+Registration+for+Racing+Events/23398623.html); [Race Roster](https://raceroster.com/articles/mobile-scanning-solutions)
- Some virtual-race platforms issue **digital bibs** with name, number, team, route and distance that can be shared on social media; Racery's premium tier adds custom-branded bibs — [Racery docs](https://i.racery.com/docs/custom-badges). RunSignUp generates downloadable virtual bibs from a template or a custom design, for virtual events only — [RunSignUp help](https://help.runsignup.com/support/solutions/articles/17000102845-setting-up-digital-bibs)
- **Achievy: Medals & Results** (App Store): photograph both sides of a medal and add result, date and event, with per-medal public, followers-only or private visibility. It is free, new, and had too few ratings to show (search extract) — [App Store](https://apps.apple.com/app/id6757123396)
- **DigiMedal**: vision AI reads race name, distance, date and city from a medal photo, with a PB board, year in review, a world map of races, and imports from Apple Health, Strava and GPX. Pricing is reported as both "free for early users" and "7-day trial then $1.99/month", which conflict; the source is a mirror listing, not the App Store — [Mergeek](https://mergeek.com/en/latest/Yd89jmVelBPW4Dg5)
- **Marathon Stars: Race Journal**, a race journal with a "digital medal cabinet" — [App Store](https://apps.apple.com/us/app/-/id6756442732)
- **Athlinks**: a free results network with more than 400 million results (March 2024). Athletes claim results to build a race history, which shows time, pace and division, gender and overall rank. It also has a "rivals" comparison — [Race Directors HQ](https://www.racedirectorshq.com/news/athlinks-surpasses-400-million-results-862); [Wikipedia](https://en.wikipedia.org/wiki/Athlinks); [ChronoTrack KB](https://knowledge.chronotrack.com/hc/en-us/articles/115001045106-Using-Athlinks-Results)
- Race organisers and photo platforms issue **digital medals**, e.g. Pic2Go RunPage, a "personal finisher platform" — [Race Directors HQ](https://www.racedirectorshq.com/pic2go-releases-digital-medals-personal-finisher-platform-runpage/); [Race Roster digital medals](https://raceroster.com/major-releases/digital-medals)

### Inferences
- The pattern "small curated highlight on the profile, full grid one tap away" recurs across Strava (4), Letterboxd (4) and Apple (3). For bibs, a "favorite bibs" or recent row on top of a full grid fits proven conventions.
- Object-likeness drives perceived value: Apple's engraved medal back, TCG Pocket's tilt and parallax, Apple Cash's gyroscope shimmer. A bib recreation could show the race name and date on its "back" (flip), with subtle tilt lighting on the Tyvek texture or foil sponsor logos.
- The Wallet stack suits a chronological "pile of bibs", but critics note the stack hides which card is on top. A grid or list toggle and a clear "top" item matter.
- Poster Event Tickets are relevant: Apple already treats an event pass as a full-bleed artwork object with date and venue. A bib is a similar object, and a post-race "bib" could mirror that visual language.
- The market gap is real: competitors focus on medals (photos) or results (databases), not on faithful bib recreations.

### Gaps
- Current (iOS 26 / watchOS 26) Fitness awards layout could not be verified first-hand, and the rotate gesture is confirmed only by iMore.
- Strava's trophy case grid layout details (column count, size) were not documented. One older help-article title includes "(Premium)", which suggests a partial gate, but this is unverified.
- No first-party descriptions were found for TCG Pocket binder layout (grid density, sorting, empty-slot placeholders).
- App Store pages for the medal apps could not be fetched, so ratings and pricing are unverified.

---

## Q2: What delight moments exist (animations, haptics, sounds), and when do they occur?

### Takeaway
Delight is concentrated at the **moment of acquisition** (pack rip, award unlock, streak milestone) and built from **layered sound, haptics and animation tuned to a physical ritual**. Rare or important items get escalating spectacle, but over-long animations without a skip option draw complaints.

### Cited Findings
- **TCG Pocket pack opening**: swiping across the top of the digital pack recreates the physical tear **"in sound and vibration"** — [The Pokémon Company](https://corporate.pokemon.co.jp/en/topics/detail/t-28/)
- The art director, Satoru Nagaya, said the team paid particular attention to the sound of opening a pack because players open packs daily. They opened many physical packs to find a pleasant sound — [GoNintendo](https://gonintendo.com/contents/40485-pokemon-trading-card-game-pocket-dev-on-why-sound-design-is-key-to-a-satisfying)
- Cards are revealed one by one, and peeking at a card's border signals that a rare card is coming. Rares get a flashy animation, tilting shows holo effects, and Immersive cards play a full cutscene on first pull (e.g. Pikachu EX's frame floats away into a forest scene) — [Shacknews review](https://www.shacknews.com/article/142323/pokemon-tcg-pocket-review-score); [GamesHub](https://www.gameshub.com/news/features/pokemon-tcg-pocket-review-2646767/); [Netto's Game Room](https://www.nettosgameroom.com/2024/11/pokemon-tcg-pocket-review.html?m=1)
- You can flip the pack and open it backwards, as players do in real life — [A-to-J Connections](https://a-to-jconnections.com/gaming/pokemon-brings-the-flashiness-of-the-tcg-to-phones-a-pokemon-tcg-pocket-review)
- Downside: Reddit users complained that promo or immersive pack animations take too long and asked for a skip — [Nintenderos](https://www.nintenderos.com/2024/12/pokemon-tcg-pocket-necesita-desesperadamente-una-caracteristica-clave-de-calidad-de-vida/)
- **Apple awards**: limited-edition awards often come with **animated Messages stickers** — [Wareable](https://www.wareable.com/apple/how-to-view-earn-apple-watch-awards-challenges-badges-achievements); [Apple Newsroom](https://www.apple.com/newsroom/2025/04/get-active-with-apple-watch/). Selecting an award plays a "visually pleasing 3D animation" — [iMore](https://www.imore.com/how-my-apple-watch-keeps-me-motivated)
- **Apple Cash card (Wallet)**: a black card with glossy bubbles whose colours shift with phone tilt, an iridescence like soap bubbles. Cult of Mac (2017) read this as a welcome return to skeuomorphism. Open-source recreations use the gyroscope — [Cult of Mac](https://www.cultofmac.com/512895/apple-pay-cash-shows-apple-hasnt-lost-attention-detail/); [Shiny library](https://swiftpackageregistry.com/efremidze/Shiny)
- **Duolingo**: the team treats streaks of one week, one month, 100 days and one year as feats worth celebrating. The milestone redesign includes a phoenix version of the owl — [Duolingo Blog: streak milestone design](https://blog.duolingo.com/streak-milestone-design-animation). There is also an animated-flame streak celebration — [Deconstructor of Fun Duolingo teardown](https://duolingo.deconstructoroffun.com/mechanics/streaks)
- A former Duolingo team member's LinkedIn post says sound, haptics and animation come together in the Friends Streak moment, with haptics "filling in the bass" (secondhand) — [LinkedIn](https://ua.linkedin.com/in/glib-trotskyi)
- **Strava Year in Sport** is a story-style annual recap of shareable stat cards, framed by Strava as "insights and storytelling" — [Ars Technica via TagTeam](https://tagteam.harvard.edu/hub_feeds/3415/feed_items/17132945/content)
- **Letterboxd Year in Review** arrived on 2 January 2026 for 2025 and required at least 10 films logged. It was delivered by email (reported as sporadic), with a community-wide release on 12 January. Contents include films logged, hours watched, most-watched actor and director, and highest-rated films — [The Tab](https://thetab.com/2026/01/02/it-can-be-confusing-so-heres-how-to-see-your-letterboxd-wrapped-for-2025); [Rotek](https://rotek.fr/letterboxd-wrapped-2025-comment-acceder-year-in-review/)

### Inferences
- For bibs, the natural delight moment is **adding a new bib**: a "pinning on" or unfold animation with one soft haptic and an optional paper or Tyvek sound, echoing TCG Pocket's physical-ritual approach. It should stay short and skippable after the first time.
- Reserve bigger spectacle for rare events (first marathon, a PB, a 10th race), matching TCG Pocket's escalation for rares and Duolingo's milestone tiers.
- An annual "Year in Bibs" recap is an established, shareable pattern (Strava, Letterboxd). Letterboxd's 10-item threshold is a useful minimum-data rule.

### Gaps
- Apple's on-earn celebration on the Watch (animation, haptic) is not documented in any source found.
- The Duolingo blog could not be fetched, so animation tooling (e.g. Rive) and exact haptic patterns are unconfirmed.
- No measurements were found linking specific animations to retention.

---

## Q3: What keeps users coming back without feeling forced? What draws criticism?

### Takeaway
Retention that feels earned comes from **consistency-based recognition** (Local Legends, ring-streak awards granted retroactively), **daily small rituals** (TCG Pocket's free daily packs) and **personal history and identity** (Letterboxd diary and favorites). Criticism targets **guilt and loss-aversion mechanics** (Duolingo), **rewarding unhealthy volume** (Untappd), **paywalling users' own history** (Strava Year in Sport) and **thin content after the novelty fades** (TCG Pocket).

### Cited Findings
- **Duolingo, official view**: the streak keeps learners motivated and is refined using habit research. Streak value is front-loaded: day 2→3 is a +50% jump, while 200→201 is only +0.5% — [Duolingo Blog](https://blog.duolingo.com/how-duolingo-streak-builds-habit)
- A Duolingo PM explicitly cites **loss aversion**, and argues that the fear of losing a streak could stop people even starting one, which is why streak freezes exist (as summarised by a CMU critique). Freezes are capped at 2 and earned via chests or bought with gems — [CMU UXA, "Performative Progress"](https://cmu-uxa.notion.site/Performative-Progress-Strava-Mules-Duolingo-Streaks-1c18eb2b3ca480f59cd2e4123ac0d7d2)
- A/B test: wagering lingots on streak length gave +5% D14 retention and a +600% rise in in-app purchase revenue (older single case study) — [Econsultancy](https://econsultancy.com/six-a-b-tests-used-by-duolingo-to-tap-into-habit-forming-behaviour/)
- **Duolingo criticism**: notifications escalate from polite to guilt-laden ("how sad he is"). A Lego product director publicised her 9-year-old daughter receiving a "quitter" message. Nir Eyal suggested age-tailored messaging — [Design Buddy](https://designbuddy.substack.com/p/is-duolingo-unethical). Critics call streaks "artificial anxiety" and leagues unhealthy competition (low-authority site) — [terms.law](https://terms.law/ToS-Watchdog/language-learning/duolingo/). A UX Collective piece argues users should not be punished for longer breaks — [UX Collective](https://uxdesign.cc/3-reframing-streaks-on-duolingo-5-ideas-for-a-more-healthy-and-flexible-approach-to-language-8fd89545771e)
- **Strava Local Legends** rewards showing up (most efforts in 90 days), not speed — "a trophy just for showing up" — [Bikerumor](https://bikerumor.com/new-strava-local-legends-feature-gives-you-a-trophy-just-for-showing-up). It was criticised for gender-split titles — [Runner's World SA](https://www.runnersworld.co.za/race-news/strava-rewards-consistency-not-speed-so-why-divide-local-legends-by-gender/)
- **Apple** ring-streak awards (100/365/500/1,000 days) were granted **retroactively** — [AppleInsider](https://appleinsider.com/articles/25/04/14/earn-rewards-boost-your-health-with-apple-watch-on-april-24). Limited-edition, date-bound awards create recurring calendar moments — [Wareable](https://www.wareable.com/apple/apple-watch-global-running-day-2026-award-details-announcement)
- **Untappd criticism**: badges reward drinking volume ("the more you drink, the more you win") and are called a hollow dopamine loop. Critics say users chase unique check-ins and badges over enjoyment, which pushes brewers to churn novelty beers — [Ben's Beer Blog 2017](https://bensbeerblog.com/2017/11/22/lets-talk-about-untappd/); [Brews News](https://brewsnews.com.au/the-anti-social-social-beer-app); [The Bottleneck](https://thebottleneck.net/2016/02/)
- Reddit (2025): newer tiered volume badges (Prodigy, Marvel, Sensation) were seen as encouraging unhealthy behaviour and cheating, and as out of reach for most users. Users asked for total-check-in milestone badges instead — [r/Untappd thread](https://lr.psf.lt/r/Untappd/comments/1jq9nh5/prodigy_marvel_sensation_etc_badges)
- **TCG Pocket**: designers expect players to open packs daily — [GoNintendo](https://gonintendo.com/contents/40485-pokemon-trading-card-game-pocket-dev-on-why-sound-design-is-key-to-a-satisfying). Reviewers call it "incredibly moreish by design" — [GamesHub](https://www.gameshub.com/news/features/pokemon-tcg-pocket-review-2646767/). Scale: more than 18 billion packs opened (Pokémon Co.), and an estimated ~$1.3B first-year revenue (AppMagic, an estimate) — [MobileSyrup](https://mobilesyrup.com/2025/11/03/pokemon-tcg-pocket-1-billion-first-year/); [Insider Gaming](https://insider-gaming.com/pokemon-tcg-pocket-first-year-revenue-estimates-hit-1-3-billion/)
- TCG Pocket criticism: a thin first event, and some players ran out of things to do within two days — [LevelUp](https://www.levelup.com/en/news/pokemon-tcg-pocket-celebrates-10-million-downloads-but-fans-criticize-underwhelming-first-event/)
- **Strava Year in Sport paywall** backlash: "how pathetic does an app need to be to put their 'Year In Review' behind a paywall when EVERYONE ELSE does theirs for free". Critics suggested basic stats for all and extra insights for subscribers — [Ars Technica via TagTeam](https://tagteam.harvard.edu/hub_feeds/3415/feed_items/17132945/content); [T3](https://www.t3.com/tech/dear-strava-we-have-a-paywall-problem-thats-gone-a-step-too-far); [road.cc](https://road.cc/content/news/strava-year-sport-now-only-subscribers-317425)
- **Letterboxd** praise centres on a clean, uncluttered, film-first identity, and a redesign study argues that identity is "the reason people love the app" — [Contra redesign](https://contra.com/p/6ZPPWlRX-uiux-redesign-for-letterboxd-app); [Punchamoorthee Substack](https://punchamoorthee.substack.com/p/a-deep-dive-into-letterboxd)

### Inferences
- Races happen a few times a year, so daily streaks are a poor fit and would recreate Duolingo's guilt problem. Better fits are **count-based milestones** (10th bib, first of each distance), **retroactive awards** when past races are imported (as Apple did), and seasonal or annual recaps.
- Avoid rewarding sheer volume. Untappd shows that volume badges can feel unhealthy, and for runners this could encourage over-racing. Celebrate meaning (first marathon, home race, PB) over quantity.
- Identity and memory (Letterboxd's diary and four favorites) give the strongest non-coercive return reason, plus the pre- and post-race moments when users add a bib.

### Gaps
- No primary Duolingo retention data on streak freezes or notifications was retrievable.
- No studies were found on retention for low-frequency event collections (e.g. concert ticket stubs or race medals).

---

## Q4: What is free and what is paid, and how is the paid tier framed?

### Takeaway
Well-liked models keep **logging, the collection itself and the user's own history free**, and charge for **deeper stats, customisation and convenience** (Letterboxd Pro/Patron, TCG Pocket cosmetics and extra packs). Strava's move of the annual recap and leaderboards behind a paywall shows that gating a user's *own* memories triggers backlash.

### Cited Findings
- **Strava**: Premium costs $11.99/month or $79.99/year in the US. There is also a student plan ($39.99/yr), a Family plan ($139.99/yr, 4 people) and a Strava + Runna bundle (~$149.99/yr), with a 30-day trial (third-party pricing sites) — [RunnersPicks](https://www.runnerspicks.com/blog/strava-pricing-is-it-worth-it/); [BikeTips](https://biketips.com/strava-free-vs-paid/)
- Free on Strava: tracking, uploads, feed and kudos, clubs, and **activity achievements (PRs, KOM/QOM, course records)**, with existing achievements preserved. Full segment leaderboards are paid (free users see their rank only if in the top 10), as are the route builder and advanced analytics. Personal achievements, segment creation and segment search stay free — [BikeRadar](https://www.bikeradar.com/news/strava-leaderboards-routes-subscription/); [Triathlete](https://www.triathlete.com/gear/tech-wearables/strava-moves-segment-leaderboards-route-builder-to-subscription/?scope=anon); [Running Magazine](https://runningmagazine.ca/?p=72126)
- Full Local Legends functionality is premium-only — [BikeRadar worldwide release](https://www.bikeradar.com/news/strava-local-legend-worldwide-release/)
- Strava put **Year in Sport behind the subscription "for the first time"**, framing it as "the added layer of insights and storytelling, including Year in Sport and monthly stat cards". It says core benefits (upload, community, kudos) stay accessible. Coverage dates the change to the December 2024 edition and repeats it for the 2025 edition — [Ars Technica via TagTeam](https://tagteam.harvard.edu/hub_feeds/3415/feed_items/17132945/content); [Gadgets & Wearables, Dec 2025](https://gadgetsandwearables.com/2025/12/20/strava-year-in-sport/). The public, aggregate Trend Report stayed free — [Strava press release via Adnkronos](https://www.adnkronos.com/immediapress/eng/strava-releases-12th-annual-year-in-sport-trend-report-revealing-that-doomscrolling-is-out-movement-is-in_iPmltuOBI6UULjUCMcmDr)
- **Letterboxd**: logging, diary, reviews, lists and four favorites are free. **Pro** (~$18.99–20/yr) adds all-time and annual stats pages (each year with ≥10 films), streaming-service filters, list cloning and no ads. **Patron** (~$48.99–49/yr) adds a profile backdrop from the first favorite film, a Patrons page listing and early access. Prices are from the App Store tracker (April 2026) and PopSci — [App Pricing Lab](https://www.apppricinglab.com/iap/apple/1054271011); [PopSci](https://www.popsci.com/diy/how-to-use-letterboxd/); [AppleVis](https://applevis.com/apps/ios/social-networking/letterboxd); [Letterboxd welcome page](https://letterboxd.com/welcome/)
- The basic annual Year in Review email appears to reach all members who logged at least 10 films, while Pro and Patron get stats year-round (secondary sources; no official free-vs-Pro statement found) — [The Tab](https://thetab.com/2026/01/02/it-can-be-confusing-so-heres-how-to-see-your-letterboxd-wrapped-for-2025); [Rotek](https://rotek.fr/letterboxd-wrapped-2025-comment-acceder-year-in-review/)
- Commentary describes Letterboxd's model as a case of niche social monetisation: "for less than a couple bucks a month" — [Founder Archive](https://founderarchive.beehiiv.com/p/letterboxd-and-niche-social-monetization)
- **TCG Pocket**: free daily packs. Premium Pass costs $9.99/month and gives one extra pack every 24h plus premium missions with cosmetics and promo cards. Poké Gold shortens pack wait timers, capped at 720/day. Reviewers call monetisation "basically entirely cosmetic driven" — [Insider Gaming](https://insider-gaming.com/?p=67866); [ptcgpocket.gg](https://ptcgpocket.gg/?p=2951); [Pokemon Zone](https://pokemon-zone.com/articles/wonder-pick-decks-premium-pass)
- **Untappd Insiders** (formerly Supporters) was originally $5/month or $50/year (older figures). Perks include check-ins with no distance limit, year-round stats and data export (export also free in the EU/EEA, per an unofficial source). Badges are not earned for check-ins beyond 60 miles, though progress counts. Past check-ins are kept if you cancel — [Untappd Help Center](https://help.untappd.com/hc/en-us/sections/360008312851-Untappd-Insiders-Previously-Untappd-Supporters); [Untappd Help: distance](https://help.untappd.com/hc/en-us/articles/360037071292-How-can-I-check-in-to-venues-that-are-greater-than-60-miles-away); [The Mary Sue](https://themarysue.com/?p=127409)
- **Apple Fitness awards** are free with Apple Watch and need only watchOS 5+ for limited-edition challenges. Fitness+ is separate and has its own awards path — [AppleInsider](https://appleinsider.com/articles/25/04/14/earn-rewards-boost-your-health-with-apple-watch-on-april-24); [Apple Support Fitness+](https://support.apple.com/en-gb/guide/fitness-plus/dev4b830ebf6/ios)
- **NBA Top Shot** sold packs (~$9) and single moments ($5, 2021) as tradeable scarce assets on a blockchain marketplace — [LV Sports Biz](https://lvsportsbiz.com/2021/08/10/nba-summer-league-as-innovation-platform-league-trying-out-top-shot-digital-game-moments-and-selling-them-for-5-each/); [Audacy](https://www.audacy.com/national/sports/what-is-nba-top-shot-everything-you-need-to-know)
- **DigiMedal** (medal catalogue) is reported at $1.99/month after a 7-day trial, conflicting with "free for early users" (unverified) — [Mergeek](https://mergeek.com/en/latest/Yd89jmVelBPW4Dg5)

### Inferences
- For a bib app, the Letterboxd model fits best: unlimited collection, a basic recap and favorites free, and a modest annual Pro (roughly $10–20/yr range, to be validated) for deep stats, extra bib design or material options, and export. A Patron-style supporter tier can sell identity perks (e.g. a profile backdrop from your favorite bib).
- Do not paywall the user's own annual recap or their existing bibs. Strava's backlash and Untappd's "past check-ins kept" policy both point the same way.
- Monetising cosmetics and convenience (TCG Pocket) works when the core collection loop stays free.

### Gaps
- Strava's and Letterboxd's official pricing pages could not be fetched, so prices are from third-party trackers and may vary by region.
- Current Untappd Insider price not found.
- No conversion-rate data was found for any of these freemium tiers.

# iOS App Home Screens, Navigation, Empty States, Onboarding and First Success (for a minimalist race-bib collection app)

Context: the app lets runners collect digital recreations of race bibs. Current draft: a start tab with a swipeable bib stack, a "Sammlung" tab with a sortable grid, and a floating glass tab bar with a separate "+" button that adds a bib by photo scan. Research date: October 2026. Sources: Apple HIG (live JSON versions fetched Oct 2026), NN/g, LukeW and RevenueCat. Apple HIG pages carry no visible publication date; NN/g dates are given where known.

## 1. What makes a good app home or start screen?

### Takeaway
No source gives one rule for "the home screen". The evidence points the same way, though: the first screen should be nearly identical to the launch screen, show the user's own content straight away, restore where they left off, and show only the few most important options. Dashboards are for glanceable, critical information, not for exploring. A start tab that shows the user's own bibs is consistent with this. A stats-heavy dashboard is not.

### Cited Findings
- Apple: "Launch instantly. People want to start interacting with your app or game right away, and sometimes they don't want to wait more than a couple of seconds." — [Apple HIG, Launching](https://developer.apple.com/design/human-interface-guidelines/launching)
- Apple: "Restore the previous state when your app restarts so people can continue where they left off… scroll the view to people's most recent position." — [Apple HIG, Launching](https://developer.apple.com/design/human-interface-guidelines/launching)
- Apple: design a launch screen "nearly identical to the first screen of your app". It "isn't a branding opportunity", so no logos and no text. — [Apple HIG, Launching](https://developer.apple.com/design/human-interface-guidelines/launching)
- Progressive disclosure: "Initially, show users only a few of the most important options." Also: "the very fact that something appears on the initial display tells users that it's important." Designs deeper than 2 disclosure levels "typically have low usability". People understand a system *better* when helped to prioritize features. — [NN/g, Jakob Nielsen, Progressive Disclosure (2006)](https://www.nngroup.com/articles/progressive-disclosure/)
- NN/g definition of a dashboard: a single-page view that "imparts at-a-glance information on which users can act quickly". Dashboards are "not intended as expansive views of complex data: Their goal is not to facilitate exploration". Area- and angle-based charts (donut, pie, radial gauge, tree map) are poor at communicating quantities at a glance. Linear encodings (bars, bullet charts) work better. — [NN/g, Page Laubheimer, Dashboards: Making Charts and Graphs Easier to Understand (2017)](https://www.nngroup.com/articles/dashboards-preattentive/)
- Up to 4.5% of the population has some colour-vision deficiency, so colour should reinforce grouping, not carry it alone. — [NN/g, Dashboards (2017)](https://www.nngroup.com/articles/dashboards-preattentive/)
- On mobile, navigation and other chrome "occupy screen space and grab users' attention". Content should take priority over UI elements. — [NN/g, Raluca Budiu, Basic Patterns for Mobile Navigation (2015)](https://www.nngroup.com/articles/mobile-navigation-patterns/)
- Liquid Glass (iOS 26) "forms a distinct functional layer for controls and navigation elements — like tab bars and sidebars — that floats above the content layer". "Liquid Glass seeks to bring attention to the underlying content". "Don't use Liquid Glass in the content layer." "Use Liquid Glass effects sparingly" on custom controls. — [Apple HIG, Materials](https://developer.apple.com/design/human-interface-guidelines/materials)
- Collections: "Use caution when making dynamic layout changes… try to avoid changing the layout while people are viewing and interacting with it, unless it's in response to an explicit action." Use a table (list) rather than a collection for text-heavy content. — [Apple HIG, Collections](https://developer.apple.com/design/human-interface-guidelines/collections)

### Inferences
- A start tab with a visual stack of the user's own bibs follows "content first". The bibs are the user's most valuable content. Stats should be limited to one or two glanceable figures (for example the bib count), or moved into the collection or detail views.
- The app should reopen on the last viewed bib or stack position, since Apple explicitly asks for state restoration.
- The bibs are visually rich, so the regular Liquid Glass variant (or a dimming layer) under the floating controls keeps them legible. The bib graphics themselves should not be glass.

### Gaps
- Apple's Liquid Glass guidance says to keep controls legible over rich backgrounds. I found no study that measures glanceability of a card stack against a grid.
- I could not retrieve Luke Wroblewski's specific writing on "home screens" or Material 3 home-screen guidance in this session. Material's site renders client-side and returned no text.

## 2. Tab bars on iOS: number of tabs, tab vs. button, separate primary action, modal for "add"

### Takeaway
On iOS 26 the tab bar is for navigation only. It floats on Liquid Glass and can include a dedicated search tab at the trailing end, plus a bottom accessory (like Music's MiniPlayer). Apple gives no fixed tab count but says fewer tabs are easier and recommends five or fewer for customizable default sets. "Add bib" is an action, so HIG puts it in a toolbar button (Mail's compose pattern) or a modal flow, not in a tab. A two-tab bar plus a prominent add action is well within the guidance.

### Cited Findings
- "Use a tab bar to support navigation, not to provide actions… If you need to provide controls that act on elements in the current view, use a toolbar instead." — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- "it's generally easier to navigate among fewer tabs". "Avoid overflow tabs" (a "More" tab hides content). For user-customizable tab bars, "aim for a default list of five or fewer". — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- "Make sure the tab bar is visible when people navigate to different sections… The exception is when a modal view covers the tab bar, because a modal is temporary and self-contained." — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- "Don't disable or hide tab bar buttons, even when their content is unavailable… If a section is empty, explain why its content is unavailable." — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- "Include tab labels… Use single words whenever possible." Prefer SF Symbols and filled icons. Reserve badges for critical information. — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- "Avoid applying a similar color to tab labels and content layer backgrounds. If your app already has bright, colorful content… prefer a monochromatic appearance for tab bars". — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- iOS (26): "A tab bar floats above content at the bottom of the screen. Its items rest on a Liquid Glass background". With an attached accessory, the tab bar can minimize on scroll and the accessory moves inline. "A tab bar can include a dedicated search tab at the trailing end." — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- The SwiftUI APIs for this are `tabViewBottomAccessory(content:)` ("Places a view as the bottom accessory of the tab view", introduced iOS 26.0), `TabBarMinimizeBehavior` and `TabRole.search`. — [Apple Developer, tabViewBottomAccessory](https://developer.apple.com/documentation/swiftui/view/tabviewbottomaccessory(content:)); [TabBarMinimizeBehavior](https://developer.apple.com/documentation/swiftui/tabbarminimizebehavior); [TabRole.search](https://developer.apple.com/documentation/swiftui/tabrole/search)
- Toolbar button pattern for creation: "Mail provides the essential New Message action in a toolbar button at the top of the Inbox view… it makes sense to offer the closely related compose action in a toolbar button". For prominent actions: "Use the .prominent style for key actions… Only specify one primary action, and put it on the trailing side of the toolbar." — [Apple HIG, Toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars)
- Modality: "Present content modally only when there's a clear benefit". Keep modal tasks "simple, short, and streamlined". Avoid "an app within your app". Full-screen modal "can work well for presenting… camera views, or to support a multistep task". "Always give people an obvious way to dismiss". Confirm before closing if user content could be lost. Title the modal with its task. — [Apple HIG, Modality](https://developer.apple.com/design/human-interface-guidelines/modality)
- Search: "If search is important, give it a primary position… In apps that use tab bars, like Photos and Apple TV, search is a dedicated tab." — [Apple HIG, Searching](https://developer.apple.com/design/human-interface-guidelines/searching)
- NN/g: tab bars "work well when the number of navigation options is small". With more than 5 options it is hard to keep good touch-target sizes. With 4–5 main options, keep them all visible. — [NN/g, Basic Patterns for Mobile Navigation (2015)](https://www.nngroup.com/articles/mobile-navigation-patterns/)
- NN/g quantitative study (179 participants, 6 sites): hidden navigation (such as a hamburger menu) cuts discoverability "almost in half", lengthens tasks and increases perceived difficulty. The effect is smaller on mobile than on desktop. Recommendation: use visible navigation if there are only 4–5 top-level choices. — [NN/g, Kara Pernice, Hamburger Menus and Hidden Navigation Hurt UX Metrics (2016)](https://www.nngroup.com/articles/hamburger-menus/); [NN/g, Beyond the Hamburger (2016)](https://www.nngroup.com/articles/find-navigation-mobile-even-hamburger/)
- Luke Wroblewski, "Obvious Always Wins": Polar's switch from a segmented control to a toggle menu made engagement "plummet". Zeebox's switch from tabs to a drawer made engagement fall "drastically". Facebook and Redbooth moving from a hamburger menu to a bottom tab bar increased engagement and sessions. — [LukeW, Obvious Always Wins](https://www.lukew.com/ff/entry.asp?1945)

### Inferences
- Two tabs ("Start" and "Sammlung") plus a distinct add control fits the HIG. Keep "+" out of the tab set. In iOS 26 the separate circular slot at the trailing end of the tab bar is the system's search-tab position. Putting a custom "+" there is a custom control that resembles a system pattern with a different meaning, so it should be tested. Two alternatives match HIG more closely: a prominent trailing toolbar button (Mail compose pattern), or a bottom accessory.
- Bib scanning involves the camera, so a full-screen modal is the HIG-endorsed container. Its title should name the task (for example "Add bib"), it needs an obvious Cancel, and it should confirm before discarding a half-edited bib.
- A search tab only earns its place if the collection grows large. For most runners (tens of bibs), search or filter inside the collection is likely enough. This is an inference, not sourced.
- Bibs are colourful, so tab icons and labels should be monochrome or a clearly distinct accent colour, per HIG.

### Gaps
- I could not retrieve Material 3's navigation-bar guidance (client-rendered site). Material's widely cited "3–5 destinations" rule is therefore not verified here.
- Apple's HIG says nothing explicit about putting a non-search action button in the iOS 26 trailing tab-bar slot. No source either endorses or forbids it.

## 3. Empty states: first run with an empty collection; empty states as onboarding

### Takeaway
Never leave a screen completely blank. An empty state should (1) say what will appear here, (2) explain how to fill it, and (3) offer a direct button to do so. NN/g calls this kind of help a "pull revelation" and finds contextual help more memorable than upfront tutorials. Apple adds: keep tabs visible even when empty, and explain why. The first-run empty start tab can therefore be the onboarding.

### Cited Findings
- "Do not default to totally empty states. This approach creates confusion". "When content does not yet exist… use the empty state to provide help cues. Tell the user what could be displayed, and how to populate the area". "Provide direct pathways (i.e., links) to getting started with key tasks". — [NN/g, Kate Kaplan, Designing Empty States in Complex Applications: 3 Guidelines (2021)](https://www.nngroup.com/articles/empty-state-interface-design/)
- In-context learning cues "are generally more successful than forced tutorials… in-context help can often be applied right away and is thus more memorable". In empty states these are "pull revelations". — [NN/g, Empty States (2021)](https://www.nngroup.com/articles/empty-state-interface-design/)
- Examples: DataDog shows "Star your favorites to list them here". Loggly offers two pathways: add a real source, or load demo data "for safe exploration". — [NN/g, Empty States (2021)](https://www.nngroup.com/articles/empty-state-interface-design/)
- Never show a misleading "No records" message while content is still loading. It erodes trust, and "trigger-happy users… never see the relevant content". Use progress indicators while loading. — [NN/g, Empty States (2021)](https://www.nngroup.com/articles/empty-state-interface-design/)
- Apple: do not hide or disable a tab when its content is empty. Explain why it is unavailable. — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)

### Inferences
- First run: the start tab shows one placeholder bib, or a sample bib clearly marked as an example (the Loggly demo-data idea). It carries one line like "Scan your first bib to start your collection" and a single primary "Scan bib" button that opens the same flow as "+".
- The empty "Sammlung" stays visible, with a short message ("Your bibs will appear here, sorted by date") and the same CTA. Sort controls are hidden or disabled until there are at least 2 bibs. This is an inference; no source covers sort controls on empty states.
- A sample bib must be easy to remove and must never mix into real stats. Inference.

### Gaps
- I found no quantitative data (from NN/g, Apple or others) on conversion lift from designed empty states against blank ones in consumer apps.

## 4. Onboarding: short or none, progressive disclosure, teaching hidden gestures; evidence on gesture discoverability

### Takeaway
NN/g and Apple both recommend avoiding upfront onboarding where possible. NN/g research found deck-of-cards tutorials did not improve task performance. If there is onboarding, it should be brief, optional, interactive and contextual. Custom gestures (swipe a stack, pull up to favourite) have poor discoverability without signifiers. They should be supplements to visible controls, taught by one-at-a-time contextual hints at first use.

### Cited Findings
- Apple: "Ideally, people can understand your app… simply by experiencing it, but if onboarding is necessary, design a flow that's fast, fun, and optional." "Teach through interactivity." "Consider providing a collection of context-specific tips instead of a single onboarding flow." "Postpone nonessential setup flows". If a tutorial is skipped, "don't present it again on subsequent launches" but keep it findable. — [Apple HIG, Onboarding](https://developer.apple.com/design/human-interface-guidelines/onboarding)
- Apple: "Prefer letting people experience your app or game before prompting them for ratings or purchases." — [Apple HIG, Onboarding](https://developer.apple.com/design/human-interface-guidelines/onboarding)
- NN/g: onboarding has higher interaction cost, strains memory and "may not improve user performance". Their "research on deck-of-cards tutorials… showed that tutorials didn't improve task performance". They "recommend professionals avoid creating app onboarding whenever possible and instead spend your resources making the UI more usable". — [NN/g, Alita Kendrick, Mobile-App Onboarding: An Analysis of Components and Techniques (2020)](https://www.nngroup.com/articles/mobile-app-onboarding/)
- Onboarding is justified only when (a) user information is needed to start, (b) functionality is highly tailored to the user, or (c) features are unique or unfamiliar. Feature-promotion carousels belong on the App Store page. Visual customization (themes) does not belong in onboarding. Coach marks should be "timely… and unobtrusive". — [NN/g, Mobile-App Onboarding (2020)](https://www.nngroup.com/articles/mobile-app-onboarding/)
- Tutorials "interrupt users, don't necessarily improve task performance, and are quickly forgotten". Users frequently skip them (the "paradox of the active user"). Pull revelations, triggered by context, avoid these problems. Make help easy to dismiss *and* to recall later. "Skip the obvious stuff." — [NN/g, Page Laubheimer, Onboarding Tutorials vs. Contextual Help (2023)](https://www.nngroup.com/articles/onboarding-tutorials/)
- Coach marks: focus each on a single, unfamiliar interaction. Short-term memory fades "in about 20 seconds". Show hints one at a time as the user reaches that section (YouTube example). Make hints visually distinct from real UI. — [NN/g, Aurora Harley, Instructional Overlays and Coach Marks for Mobile Apps (2014)](https://www.nngroup.com/articles/mobile-instructional-overlay/)
- Gesture discoverability: "Lack of signifiers makes it unclear where the contextual swipe can be used. (This is a general problem for gesture-based interactions.)". Even users who know a gesture "may occasionally forget to perform it in the absence of any visible cues". Many actions behind one gesture are hard to remember (the "fan effect"). Easy gestures cause accidental actions, so provide confirmation or undo. Horizontal swipe conflicts with iOS edge-swipe Back. — [NN/g, Angie Li, Contextual Swipe (2017)](https://www.nngroup.com/articles/contextual-swipe/)
- A menu reachable only by a gesture, with no signifier (the Sephora example): "Most users would never discover this feature". — [NN/g, Basic Patterns for Mobile Navigation (2015)](https://www.nngroup.com/articles/mobile-navigation-patterns/)
- Apple: "Add custom gestures only when necessary". They must be discoverable and distinct. "Use shortcut gestures to supplement standard gestures, not replace them". "Avoid using a familiar gesture like tap or swipe to perform an action that's unique to your app". Give feedback during the gesture. Indicate when a gesture isn't available. — [Apple HIG, Gestures](https://developer.apple.com/design/human-interface-guidelines/gestures)
- Apple accessibility: "Offer alternatives to gestures… if you use a swipe gesture to dismiss a view, also make a button available". Avoid auto-dismissing, timed UI. — [Apple HIG, Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)

### Inferences
- No onboarding carousel. Go straight to the start tab's empty state, then into the scan flow.
- Swiping a card stack is a familiar, Tinder- or Wallet-like pattern. A visible partial peek of the next card is a signifier. "Pull up to favourite" is a custom gesture. It needs a visible equivalent (for example a heart or star button on the bib or its detail view), plus a single one-time hint shown after the user has at least 2 bibs (the pull-revelation timing). It also needs an undo.
- Horizontal stack swipes should not start at the screen's left edge, to avoid clashing with system Back.

### Gaps
- I found no recent (2023–2026) quantitative NN/g or academic data on the discovery rate of specific custom gestures such as "pull up to favourite" in consumer iOS apps.

## 5. Time to value / "aha moment": fast first success, activation metrics

### Takeaway
Subscription-app data says the decision window is minutes, not days. RevenueCat reports that 82% of trial starts happen on day 0, and 55% of 3-day-trial cancellations also happen on day 0. "First bib scanned and shown in the collection within the first session (ideally under a minute)" is therefore a sensible activation event to design and measure against. I found no primary Lenny or Reforge source in this session.

### Cited Findings
- RevenueCat (State of Subscription Apps 2025): "82% of subscription app trial starts still happen on day zero". The author's own app data: "Over 80% of all subscriptions happened within two minutes of download". — [RevenueCat blog, Why the first two minutes of onboarding are your biggest growth lever](https://www.revenuecat.com/blog/growth/fix-onboarding-funnels)
- RevenueCat (State of Subscription Apps 2026): 55.4% of 3-day-trial cancellations occur on day 0 (about 51% in 2025), and 84% occur between day 0 and day 1. "If you don't deliver an aha! moment in the first 60 minutes, the subscriber is already gone." — [RevenueCat, Subscription app trends & benchmarks 2026](https://www.revenuecat.com/blog/growth/subscription-app-trends-benchmarks-2026)
- The State of Subscription Apps 2026 dataset covers more than 115,000 apps and more than $16B in revenue from RevenueCat customers, so results may not generalize. — [RevenueCat, State of Subscription Apps 2026](https://www.revenuecat.com/state-of-subscription-apps)
- Time to value is defined as the time from sign-up to the "aha moment". — [GoPractice, Time to Value](https://gopractice.io/product/time_to_value) (secondary source)
- Apple: "Don't let large downloads hinder onboarding. People want to start using your app… immediately after first launching it". Provide sensible defaults so people "can immediately start interacting". — [Apple HIG, Onboarding](https://developer.apple.com/design/human-interface-guidelines/onboarding)
- RevenueCat anecdote: 30–40% of paying users of one app did not download or use it in the first week, which suggests post-purchase activation also matters ("aftercare"). — [RevenueCat blog, How top apps approach paywalls](https://www.revenuecat.com/blog/growth/how-top-apps-approach-paywalls)

### Inferences
- Candidate activation metric: share of new installs that save at least one bib on day 0. Secondary metrics: median time from first launch to first saved bib, and share of users with 3 or more bibs by day 7.
- To shorten time to value: no account wall before the first scan, camera permission requested only when "Scan" is tapped, an editable auto-filled recreation, and a satisfying reveal of the bib landing on the stack (the first success moment).

### Gaps
- Searches did not surface original Lenny's Newsletter, Reforge or Appcues articles on activation. The only results were secondary summaries, so I have no primary-source activation benchmarks (for example "good activation rate %").
- I found no published time-to-value benchmarks for collection or scan apps.

## 6. Sorting and filtering UI on mobile; grouping with section headers

### Takeaway
Apple suggests a Sort button that opens a menu (pull-down button) for choosing the sort attribute. Segmented controls are for a few closely related, mutually exclusive view choices (about five or fewer on iPhone). Group logically related menu items with separators. Keep submenus to one level and five or fewer items.

### Cited Findings
- "A Sort button could use a menu to let people select an attribute on which to sort." List at least 3 items in a pull-down. Don't hide a view's primary actions in a pull-down. — [Apple HIG, Pull-down buttons](https://developer.apple.com/design/human-interface-guidelines/pull-down-buttons)
- Menus: group logically related items with separators. Use a submenu when a term like "Sort by" repeats (example: "Sort by Date, Score, Time" become a "Sort by" submenu). Limit submenus to one level and about five items. — [Apple HIG, Menus](https://developer.apple.com/design/human-interface-guidelines/menus)
- Segmented controls: "Use a segmented control to provide closely related choices that affect an object, state, or view." Aim for "no more than about five segments on iPhone". Use text or images in a control, not both mixed. Don't mix action segments with selection segments. — [Apple HIG, Segmented controls](https://developer.apple.com/design/human-interface-guidelines/segmented-controls)
- Search can act as a filter on the current view (Music app). Clearly show the search scope. — [Apple HIG, Searching](https://developer.apple.com/design/human-interface-guidelines/searching)

### Inferences
- "Sammlung": a trailing toolbar Sort menu (Date, Distance, Name, Time) with a direction toggle. Section headers by year when sorted by date, or by distance category (5K / 10K / HM / M). An optional segmented control for distance only if there are 4 or fewer categories.
- The grid layout should not reflow unexpectedly. Animate re-sorting only in response to an explicit sort choice (HIG Collections).

### Gaps
- I did not retrieve dedicated NN/g mobile sort or filter guidance. Several guessed URLs returned 404, and the faceted-search article was downloaded but not analysed. I also found no Apple guidance on section headers in grid collections beyond the general collections page.

## 7. Common app design mistakes; paywall placement in freemium apps

### Takeaway
The recurring mistakes are hidden navigation or actions, onboarding carousels, too many tabs or overflow, permission requests before need, low contrast, and gesture-only features. Paywall evidence conflicts. Apple advises letting people experience the app before purchase prompts. RevenueCat data shows hard or early paywalls convert about 5x better by day 35, though retention is equal. For a minimalist collector app, a freemium model where the first bibs are free and the paywall appears at a value moment matches Apple's guidance. It probably gives up some early conversion, judging by RevenueCat's averages.

### Cited Findings
- **Permissions too early:** "Request permission only when your app clearly needs access… Ideally, wait to request permission until people actually use an app feature that requires access." Asking "before a person shows interest in the feature — can make it hard for people to trust your app". A pre-alert screen may have only one button ("Continue"/"Next"), not "Allow", and no way to skip the system alert. — [Apple HIG, Privacy](https://developer.apple.com/design/human-interface-guidelines/privacy)
- Explaining the reason raises grant rates: users were 12% more likely to grant with a purpose string, and the best reason wording gave an 81% lift over the worst (Tan et al., cited by NN/g). Write benefit-oriented copy without jargon. — [NN/g, Maria Rosala, 3 Design Considerations for Effective Mobile-App Permission Requests (2019)](https://www.nngroup.com/articles/permission-requests/)
- **Hidden navigation:** discoverability is cut almost in half when navigation is hidden. — [NN/g, Hamburger Menus (2016)](https://www.nngroup.com/articles/hamburger-menus/). Engagement dropped when tabs were replaced with menus (Polar, Zeebox). — [LukeW, Obvious Always Wins](https://www.lukew.com/ff/entry.asp?1945)
- **Too many tabs / overflow:** "Avoid overflow tabs". — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- **Unclear primary action:** "Only specify one primary action" per toolbar. — [Apple HIG, Toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars). "A view's primary actions need to be easily discoverable", so don't bury them in a menu. — [Apple HIG, Pull-down buttons](https://developer.apple.com/design/human-interface-guidelines/pull-down-buttons)
- **Low contrast:** "Strive to meet color contrast minimum standards" (WCAG or APCA). Check light and dark modes. Support Increase Contrast and Dynamic Type up to at least 200% text enlargement. Prefer system colours. — [Apple HIG, Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility). Use regular (not clear) Liquid Glass, or add a dimming layer, where legibility is at risk. — [Apple HIG, Materials](https://developer.apple.com/design/human-interface-guidelines/materials)
- **Gesture-only features:** "Offer alternatives to gestures". — [Apple HIG, Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility). "Use shortcut gestures to supplement standard gestures, not replace them". — [Apple HIG, Gestures](https://developer.apple.com/design/human-interface-guidelines/gestures)
- **Onboarding as feature advertising / feature overload:** avoid feature-promotion onboarding at first launch. Overlays that highlight every interaction (NOAA Weather) are "highly obtrusive". — [NN/g, Mobile-App Onboarding (2020)](https://www.nngroup.com/articles/mobile-app-onboarding/). Showing too many options at once fails to focus attention. — [NN/g, Progressive Disclosure](https://www.nngroup.com/articles/progressive-disclosure/)
- **Badges overused:** "Reserve badges for critical information so you don't dilute their impact". — [Apple HIG, Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- **Paywall timing (Apple):** "Prefer letting people experience your app… before prompting them for ratings or purchases." — [Apple HIG, Onboarding](https://developer.apple.com/design/human-interface-guidelines/onboarding)
- **Paywall timing (RevenueCat 2026 data):** median day-35 download-to-paid conversion is 10.7% for hard paywalls against 2.1% for freemium (about 5x). Hard paywalls fell from 12.1% in 2025. Revenue per install at day 60 is $3.09 against $0.38. 1-year retention of yearly subscribers is 27% (hard) against 28% (freemium). "Freemium apps continue to convert well into Week 6 and beyond." — [RevenueCat, Subscription app trends & benchmarks 2026](https://www.revenuecat.com/blog/growth/subscription-app-trends-benchmarks-2026)
- **Trial length:** trials of 17 days or more have a median conversion of 42.5%, against 25.5% for trials of 4 days or less. — [RevenueCat, Free trial length](https://www.revenuecat.com/blog/growth/free-trial-length) (via search snippet; summarizes State of Subscription Apps 2026)
- **Paywall placement anecdote:** in one app, a paywall *before* onboarding (welcome, paywall, onboarding) got 8% trial opt-in against 2% for welcome, onboarding, home, paywall. Adding a 3-part value carousel before the paywall got 15%. Showing the paywall multiple times matters, as some users need several exposures. — [RevenueCat blog, How top apps approach paywalls](https://www.revenuecat.com/blog/growth/how-top-apps-approach-paywalls) (single-app anecdote, not a controlled benchmark)
- "Honest paywall" example: Blinkist reported +23% conversion and −55% complaints after clarifying trial reminders (cited by RevenueCat). — [RevenueCat blog, How top apps approach paywalls](https://www.revenuecat.com/blog/growth/how-top-apps-approach-paywalls)

### Inferences
- Conflict to flag: Apple and NN/g UX guidance favours value first. RevenueCat revenue data favours early, harder paywalls. RevenueCat's sample is biased toward monetization-optimized subscription apps, and its retention numbers are equal across models. For a niche, emotional collection app whose value builds with each bib, a sensible middle path is: free core (scan and collect the first N bibs), with the paywall shown at a natural value moment (for example when saving bib N+1, or when using premium designs or export). A soft paywall can also be shown at the end of the first-success moment, not before it. This is an inference to validate with A/B tests.
- Camera permission: request it only on the first tap of "Scan", with a purpose string phrased as a benefit (for example "to photograph your bib and recreate it digitally").

### Gaps
- No RevenueCat breakdown was available for "collection/hobby" or "health & fitness" categories in this session. The category pages exist but were not fetched.
- I found no controlled study (as opposed to anecdotes) comparing a paywall shown after the first success moment with one shown in onboarding.

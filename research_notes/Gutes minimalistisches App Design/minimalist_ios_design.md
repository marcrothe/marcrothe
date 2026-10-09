# Good Minimalist iOS App Design (Apple HIG, Liquid Glass, Dark UI, Accessibility)

Context: notes for a minimalist iPhone app with a pure black background where collectible race bibs (Startnummern) are the main visual content. State as of 9 Oct 2026. iOS 26 (Liquid Glass) shipped Sept 2025, and iOS 27 (a Liquid Glass refinement) shipped 14 Sept 2026. Older material is marked **[older]**.

Method note: the Apple HIG pages render client side, so their text was read from Apple's own JSON data behind each HIG URL. Quotes are verbatim from the live HIG as of Oct 2026. The HIG change logs show the Liquid Glass updates: materials (9 Jun 2025, 9 Sep 2025), tab bars (28 Jul 2025, 16 Dec 2025, 8 Jun 2026 "Updated terminology and art"), color, buttons and toolbars (16 Dec 2025), typography (16 Dec 2025, emphasized weights added).

---

## 1. What Apple's HIG says about hierarchy, clarity, deference to content, consistency, typography, spacing, color, dark mode and motion

### Takeaway
Apple's current guidance boils down to four rules: content first, few controls, hierarchy through layout, size, weight and grouping rather than decoration, and semantic system colors and text styles so Dark Mode, Dynamic Type and contrast settings work automatically. The old iOS 7 themes "Clarity, Deference, Depth" are not the current wording. The 2025+ framing is hierarchy, harmony and consistency, with Liquid Glass as a separate control layer above the content.

### Cited Findings

**Principles and framing**
- **[older, iOS 7 to about 2022]** The classic HIG themes were Deference, Clarity and Depth. Deference means the UI helps people understand and interact with content without competing with it. Clarity means legible text, precise icons and subtle decoration. Depth means layers and motion convey hierarchy. Archived 2014 HIG PDF, via search summary, not opened directly: [Archived iOS HIG 2014 (PDF)](https://www.evl.uic.edu/datsoupi/420_14/docs/MobileHIG.pdf); [Netguru summary](https://netguru.com/blog/ios-human-interface-guidelines)
- The WWDC25 session "Get to know the new design system" asks for designs that are "dynamic, harmonious, and consistent across devices", and says "Instead of relying on decoration, hierarchy should be expressed through layout and grouping." — [WWDC25 Session 356](https://developer.apple.com/videos/play/wwdc2025/356/)
- The same session's summary says: "Remove background colors from custom toolbars and tab bars. Rely on layout and grouping to express hierarchy rather than unnecessary decoration." — [WWDC25 Session 356](https://developer.apple.com/videos/play/wwdc2025/356/)
- HIG "Designing for iOS": "Help people concentrate on primary tasks and content by limiting the number of onscreen controls while making secondary details and actions discoverable with minimal interaction." It also says controls in the middle or bottom of the display are easier to reach. — [HIG: Designing for iOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios)

**Layout and spacing**
- "Order content by relative importance… place the most important items near the top and leading side." "Align elements to make them easier to scan, and use indentation to convey hierarchy." "Group related items… you might use negative space, container shapes, or separator lines." — [HIG: Layout](https://developer.apple.com/design/human-interface-guidelines/layout)
- "Use progressive disclosure to make layouts cleaner… use scrollable sections to showcase additional content, which is particularly useful for media-focused apps." — [HIG: Layout](https://developer.apple.com/design/human-interface-guidelines/layout)
- "Differentiate controls from content… Instead of applying a solid or semi-opaque background color beneath controls, use a scroll edge effect… For full-screen background content, be sure to extend it underneath sidebars, toolbars, and tab bars." — [HIG: Layout](https://developer.apple.com/design/human-interface-guidelines/layout)
- Respect safe areas so the Dynamic Island and system bars don't hide content. Use system margins and layout guides. — [HIG: Layout](https://developer.apple.com/design/human-interface-guidelines/layout)
- The HIG gives no fixed iOS spacing scale in points. It defers to system margins and layout guides. The only numeric spacing rules found are the 44×44 pt hit region and visionOS/tvOS values. See Gaps.

**Typography**
- iOS default text size is 17 pt and the minimum is 11 pt. — [HIG: Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
- "In general, avoid light font weights… prefer Regular, Medium, Semibold, or Bold… avoid Ultralight, Thin, and Light font weights, which can be difficult to see, especially when text is small." — [HIG: Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
- "Adjust font weight, size, and color as needed to emphasize important information… Minimize the number of typefaces you use." — [HIG: Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
- SF Pro is the iOS system font, and New York (NY) is the available serif. The system fonts use "dynamic optical sizes", with weights from Ultralight to Black and widths including Condensed and Expanded. SF Symbols match text weights. — [HIG: Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
- iOS Dynamic Type at the default "Large" size (style, weight, size/leading in pt):

  | Style | Weight | Size/leading (pt) |
  |---|---|---|
  | Large Title | Regular | 34/41 |
  | Title 1 | Regular | 28/34 |
  | Title 2 | Regular | 22/28 |
  | Title 3 | Regular | 20/25 |
  | Headline | Semibold | 17/22 |
  | Body | Regular | 17/22 |
  | Callout | Regular | 16/21 |
  | Subhead | Regular | 15/20 |
  | Footnote | Regular | 13/18 |
  | Caption 1 | Regular | 12/16 |
  | Caption 2 | Regular | 11/13 |

  Emphasized weights are Bold for the titles and Semibold for the rest. — [HIG: Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
- Dynamic Type rules: "Make sure your app's layout adapts to all font sizes", "Keep text truncation to a minimum", "Consider… a stacked layout" at large sizes, and "Maintain a consistent information hierarchy regardless of the current font size." — [HIG: Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
- In the 2025 design system, "Typography has been refined to strengthen clarity and structure, now bolder and left-aligned to improve readability in key moments like alerts and onboarding." — [WWDC25 Session 356](https://developer.apple.com/videos/play/wwdc2025/356/)

**Color**
- "Avoid using the same color to mean different things." Supply light, dark and increased-contrast variants for custom colors. "Even if your app ships in a single appearance mode, provide both light and dark colors to support Liquid Glass adaptivity." — [HIG: Color](https://developer.apple.com/design/human-interface-guidelines/color)
- "Avoid relying solely on color to differentiate between objects, indicate interactivity, or communicate essential information." — [HIG: Color](https://developer.apple.com/design/human-interface-guidelines/color)
- iOS background hierarchy: primary for the overall view, secondary for grouping inside it, tertiary for grouping inside secondary. Label colors run label, secondaryLabel, tertiaryLabel, quaternaryLabel. "Avoid redefining the semantic meanings of dynamic system colors." — [HIG: Color](https://developer.apple.com/design/human-interface-guidelines/color)
- "In apps with primarily monochromatic content or backgrounds, choosing your brand color as the app accent color can be an effective way to tailor your app experience." For colorful content, "prefer a monochromatic appearance for toolbars and tab bars." — [HIG: Color](https://developer.apple.com/design/human-interface-guidelines/color)

**Dark Mode**
- "In rare cases, consider using only a dark appearance in the interface. For example, it can make sense for an app that supports immersive media viewing to use a permanently dark appearance that lets the UI recede and helps people focus on the media." — [HIG: Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode)
- "Avoid offering an app-specific appearance setting." — [HIG: Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode)
- "At a minimum, make sure the contrast ratio between colors is no lower than 4.5:1. For custom foreground and background colors, strive for a contrast ratio of 7:1, especially in small text." — [HIG: Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode)
- "Soften the color of white backgrounds. If you display a content image that includes a white background, consider slightly darkening the image to prevent the background from glowing in the surrounding Dark Mode context." — [HIG: Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode)
- iOS uses "two sets of background colors — called base and elevated… The base colors are dimmer… the elevated colors are brighter, making foreground interfaces appear to advance." "Prefer the system background colors", because sheets and popovers switch to elevated automatically. — [HIG: Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode)
- Test with Increase Contrast and Reduce Transparency, separately and together, in Dark Mode. — [HIG: Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode)
- In Dark Mode, `systemBackground` is pure black (and pure white in light mode). — [mackuba WWDC19 notes, **older** 2019](https://mackuba.eu/notes/wwdc19/implementing-dark-mode-ios/). The same notes say elevated backgrounds are "slightly darker", which contradicts the HIG's "elevated colors are brighter". Trust the HIG.

**Motion**
- "Add motion purposefully… Don't add motion for the sake of adding motion." "Make motion optional." "Aim for brevity and precision in feedback animations." "In apps, generally avoid adding motion to UI interactions that occur frequently." "Let people cancel motion." — [HIG: Motion](https://developer.apple.com/design/human-interface-guidelines/motion)
- Liquid Glass motion "responds to direct touch interaction with greater emphasis… but produces a more subdued effect when a person interacts using a trackpad." — [HIG: Motion](https://developer.apple.com/design/human-interface-guidelines/motion)

**Buttons and consistency**
- "Keep the number of prominent buttons to one or two per view." "Use style — not size — to visually distinguish the preferred choice." — [HIG: Buttons](https://developer.apple.com/design/human-interface-guidelines/buttons)
- Toolbars: "Make sure the meaning of each control is clear. Don't make people guess or experiment." Use the standard Back and Close buttons. "Minimize the number of groups… aim for a maximum of three." — [HIG: Toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars)
- "Consider temporarily hiding toolbars for a distraction-free experience… offer ways to reliably restore hidden interface elements." — [HIG: Toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars)

### Inferences
- A permanently dark, media-focused bib gallery is explicitly allowed by the HIG under "immersive media viewing". It is not a rule violation. Even so, Apple advises supplying light and dark variants of custom colors, because Liquid Glass adapts.
- For the bib app, the HIG's model fits well: bibs are the content layer, while a few controls (filter, add, settings) sit on the system Liquid Glass layer. Hierarchy should come from bib size, grid rhythm and text style, not from frames, shadows or colored panels.
- Bib photos often have white paper backgrounds. Following "soften white backgrounds", slightly dim bright bib images on black, or add a subtle elevated card, so they don't glow harshly.

### Gaps
- The current HIG has no single page restating the principles as "hierarchy, harmony, consistency". That framing comes from WWDC25 talk wording and Apple marketing ("harmony"). No verbatim current HIG "principles" page was found, because the HIG root's "Design fundamentals" section is only a link list.
- The HIG gives no fixed spacing or grid scale (such as 8 pt) for iOS. Common "8 pt grid" advice is community convention, not Apple's.
- The exact hex values of system colors were not verifiable from the HIG text extraction (the swatches are images). The commonly cited elevated #1C1C1E and secondaryLabel at about 60% white are unverified.

---

## 2. iOS 26 "Liquid Glass" (WWDC June 2025) and its iOS 27 refinement: behavior, Apple's recommendations, criticism

### Takeaway
Liquid Glass is a translucent, lensing material reserved for a floating control and navigation layer: tab bars, toolbars, menus and prominent buttons. Bars float, the tab bar can minimize on scroll, and shapes are concentric with the device corners. Apple says to use it sparingly, never in the content layer and never glass on glass. Strong legibility and usability criticism (most notably NN/g, Oct 2025) led to a Clear/Tinted toggle in iOS 26.1 and, in iOS 27 (shipped Sept 2026), less default transparency, darker edges and a clear-to-tinted slider.

### Cited Findings

**What it is**
- Announced 9 Jun 2025: "This translucent material reflects and refracts its surroundings, while dynamically transforming to help bring greater focus to content." Alan Dye called it "our broadest software design update ever." It covers iOS 26, iPadOS 26, macOS Tahoe 26, watchOS 26 and tvOS 26. — [Apple Newsroom](https://www.apple.com/newsroom/2025/06/apple-introduces-a-delightful-and-elegant-new-software-design/)
- Controls "now fit perfectly concentric with the rounded corners of modern hardware and app windows… Controls are crafted out of Liquid Glass and act as a distinct functional layer that sits above apps… dynamically morph as users need more options." — [Apple Newsroom](https://www.apple.com/newsroom/2025/06/apple-introduces-a-delightful-and-elegant-new-software-design/)
- "In iOS 26, when users scroll, tab bars shrink to bring focus to the content while keeping navigation instantly accessible. The moment users scroll back up, tab bars fluidly expand." — [Apple Newsroom](https://www.apple.com/newsroom/2025/06/apple-introduces-a-delightful-and-elegant-new-software-design/)
- Liquid Glass "visually defines itself… through something called Lensing." Objects "materialize in and out by gradually modulating the light bending." Larger glass, such as an open menu, simulates "a thicker, more substantial material". Small elements like nav and tab bars "flip from light to dark based on the background", while large elements like menus and sidebars don't flip. — [WWDC25 Session 219 "Meet Liquid Glass"](https://developer.apple.com/videos/play/wwdc2025/219/)

**Concentric shapes**
- "We use three shape types to build concentric layouts: fixed shapes have a constant corner radius. Capsules use a radius that's half the height of the container. And concentric shapes calculate their radius by subtracting padding from the parent's." "For phone layouts, use a capsule with extra margin to create space near the screen edge." Watch for nested corners that feel "too pinched — or flared". — [WWDC25 Session 356](https://developer.apple.com/videos/play/wwdc2025/356/)
- Toolbar items: "standard buttons, text fields, headers, and footers have corner radii that are concentric with bar corners. If you need to create a custom component, ensure that its corner radius is also concentric." — [HIG: Toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars)

**Tab bars (iOS)**
- "A tab bar floats above content at the bottom of the screen. Its items rest on a Liquid Glass background." With an attached accessory (such as Music's MiniPlayer) "you can choose to minimize the tab bar and move the accessory inline with it when a person scrolls down", and people exit by tapping a tab or scrolling to the top. There is an optional "dedicated search tab at the trailing end." — [HIG: Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- "Use a tab bar to support navigation, not to provide actions." "Make sure the tab bar is visible." "Don't disable or hide tab bar buttons." "Include tab labels… Use single words whenever possible." "Prefer filled symbols." Avoid the More overflow tab. — [HIG: Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
- Accessories hold persistent features only: "Avoid placing screen-specific actions here." — [WWDC25 Session 356](https://developer.apple.com/videos/play/wwdc2025/356/)

**Apple's adoption rules**
- "Don't use Liquid Glass in the content layer… use standard materials for elements in the content layer." "Use Liquid Glass effects sparingly… Limit these effects to the most important functional elements." — [HIG: Materials](https://developer.apple.com/design/human-interface-guidelines/materials)
- Variants: Regular "blurs and adjusts the luminosity of background content" and is used by most system components. Clear "is highly translucent" and is only for components "that appear over visually rich backgrounds" such as photos and video. Over bright content, "consider adding a dark dimming layer of 35% opacity". Over sufficiently dark content no dimming is needed. — [HIG: Materials](https://developer.apple.com/design/human-interface-guidelines/materials)
- "Always avoid glass on glass." Regular and Clear "should never be mixed." Clear only when "the element… is over media-rich content", a dimming layer is acceptable, and "the content sitting above it is bold and bright." "In steady states, such as when an app first launches, avoid intersections between content and Liquid Glass." — [WWDC25 Session 219](https://developer.apple.com/videos/play/wwdc2025/219/)
- Color on glass: "Apply color sparingly… To emphasize primary actions, apply color to the background rather than to symbols or text… Refrain from adding color to the background of multiple controls." — [HIG: Color](https://developer.apple.com/design/human-interface-guidelines/color). "When every element is tinted, nothing stands out… If you want to imbue color into your app, do it in the content layer instead." — [WWDC25 Session 219](https://developer.apple.com/videos/play/wwdc2025/219/)
- Scroll edge effects "replace hard dividers with subtle blur… scroll edge effects are not decorative." Soft is the default on iOS. "Apply one scroll edge effect per view." — [WWDC25 Session 356](https://developer.apple.com/videos/play/wwdc2025/356/)
- Accessibility is built in: "Reduced Transparency, makes Liquid Glass frostier… Increased contrast, makes elements predominantly black or white and highlights them with a contrasting border and Reduced Motion decreases the intensity of some effects and disables any elastic properties." — [WWDC25 Session 219](https://developer.apple.com/videos/play/wwdc2025/219/)
- "Bars now rely more on symbols than text." Don't group a text button with a symbol button, because it reads as one button. — [WWDC25 Session 356](https://developer.apple.com/videos/play/wwdc2025/356/)

**Criticism**
- NN/g, Raluca Budiu, 10 Oct 2025, "Liquid Glass Is Cracked, and Usability Suffers in iOS 26": "iOS 26's visual language obscures content instead of letting it take the spotlight." The article covers text over busy images, "text on top of text" in Mail, and floating controls that "compete for attention". On animation: "Motion for motion's sake is not usability." It reports crowded, smaller tap targets ("the long‑standing guideline of at least 0.4cm between targets (and 1cm × 1cm tap areas) seems to have been tossed out"), lost predictability from appearing and collapsing controls, the back button losing its label, and a pale floating search bar that's "easy to miss". Its conclusion: "Apple is prioritizing spectacle over usability." — [NN/g](https://www.nngroup.com/articles/liquid-glass/)
- Legibility was a recurring concern, "particularly in low-contrast conditions such as direct sunlight". During the betas Apple increased bar opacity and refined overlays. — [Wikipedia: Liquid Glass](https://en.wikipedia.org/wiki/Liquid_Glass)
- iOS 26.1 (beta 4, 20 Oct 2025) added a Clear/Tinted toggle. "Tinted increases the opacity of Liquid Glass and adds more contrast", added because of user feedback. — [MacRumors](https://www.macrumors.com/2025/10/20/ios-26-1-liquid-glass-toggle/)
- iOS 27 (WWDC 8 Jun 2026; released 14 Sep 2026): Liquid Glass "more effectively diffuses complex content, improving readability". It adds "a darkened edge around Liquid Glass elements, along with brighter specular highlights", a transparency slider "from ultra clear to fully tinted", and a uniform top toolbar effect when content scrolls under floating bars. Apps get these changes without recompiling. — [MacRumors, 10 Jun 2026](https://www.macrumors.com/2026/06/10/how-liquid-glass-is-changing-in-ios-27/)
- iOS 27 "reduced default transparency" and revamped app icons "to make them more recognizable". — [Wikipedia: Liquid Glass](https://en.wikipedia.org/wiki/Liquid_Glass)

### Inferences
- On a pure black app background, the system's Regular glass will render dark, high-contrast bars. Most legibility criticism concerns busy or bright content behind glass. A black canvas avoids the worst case, but colorful bib photos scrolling under a floating tab bar can reproduce it. The scroll edge effect and Regular, not Clear, glass are the safeguards.
- Because users can now push glass anywhere from ultra clear to fully tinted, and turn on Reduce Transparency, the app must not depend on a particular glass look. Use system components and test the extremes.
- With only one or two sections, the app may need no tab bar at all. A single toolbar plus a single prominent "add bib" action fits the HIG's "one or two prominent buttons per view".

### Gaps
- The full text of the iOS 27 HIG deltas could not be isolated. The tab-bar change log only says "Updated terminology and art" (8 Jun 2026). Whether iOS 27 renamed any APIs or behaviors such as tab bar minimization was not verified.
- No quantitative usability study of Liquid Glass (as opposed to expert critique) was found.
- Design-press reactions to the iOS 27 changes beyond MacRumors and Wikipedia (Verge, 9to5Mac, Tom's Guide) were seen only as search snippets.

---

## 3. Core principles of minimalism in UI (reduction, one primary action, negative space, hierarchy via size and weight, limited palette, content first)

### Takeaway
Minimalism, done properly, removes everything that doesn't support the user's task, but it keeps every element the task needs. Its tools are negative space, restrained color with at most one accent, and typographic contrast in size and weight. Its risk is cutting signifiers and information along with the clutter.

### Cited Findings
- Dieter Rams, principle 10: "Good design is as little design as possible. Less, but better – because it concentrates on the essential aspects, and the products are not burdened with non-essentials. Back to purity, back to simplicity." — [Vitsœ: Good design](https://www.vitsoe.com/us/about/good-design)
- Rams, "Good design is unobtrusive": products "are like tools. They are neither decorative objects nor works of art. Their design should therefore be both neutral and restrained, to leave room for the user's self-expression." Other principles include understandable, honest and aesthetic ("only well-executed objects can be beautiful"). — [Vitsœ](https://www.vitsoe.com/us/about/good-design)
- NN/g heuristic #8: "Interfaces should not contain information which is irrelevant or rarely needed. Every extra unit of information in an interface competes with the relevant units of information and diminishes their relative visibility." The corollary: "a minimalist design contains all necessary elements to support user tasks." And "Communicate; don't decorate." "Every piece of content should have a purpose, including negative space." (Therese Fessenden, 2021) — [NN/g: Aesthetic and Minimalist Design](https://www.nngroup.com/articles/aesthetic-minimalist-design/)
- The same article warns that "minimalist visual design (sometimes referred to as flat design) does not always satisfy this heuristic by default (and is often guilty of removing necessary elements)." It recommends progressive disclosure for less common tasks. — [NN/g](https://www.nngroup.com/articles/aesthetic-minimalist-design/)
- **[older, 2015, web-focused]** NN/g analyzed 112 minimalist sites. The defining traits were flat patterns (96%, "but often ineffectively"), a limited or monochromatic palette (95%; 49% monochrome, 46% with one or two accent colors), restricted elements (87%), maximized negative space (84%) and dramatic typography (75%). "Many minimalist designs are either monochromatic, or use only one bold color as an accent… These accented elements are usually clickable." "Use accent colors intentionally and consistently to highlight very important information or primary actions." "Variations in font size, weight, and style become crucial in helping users understand the hierarchy." (Kate Moran, 2015) — [NN/g: Characteristics of Minimalism](https://www.nngroup.com/articles/characteristics-minimalism/)
- On negative space, the same article asks how it changes the communicated hierarchy, what lands at the top of the screen, and "the interaction cost: will users need to work harder to get to the information that they need?" — [NN/g](https://www.nngroup.com/articles/characteristics-minimalism/)
- Apple's version of one primary action: "use a button that has a prominent visual style for the most likely action in a view… Keep the number of prominent buttons to one or two per view. Presenting too many prominent buttons increases cognitive load." — [HIG: Buttons](https://developer.apple.com/design/human-interface-guidelines/buttons)
- Apple's version of content first: "Help people concentrate on primary tasks and content by limiting the number of onscreen controls." — [HIG: Designing for iOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios)
- Refactoring UI (Wathan & Schoger), via a search summary because the Medium page blocked access: de-emphasize with a lighter color or smaller size rather than a lighter weight. "Emphasize by de-emphasizing": make competing elements quieter instead of making the primary one louder. Don't use grey text on colored backgrounds; move the text color toward the background hue instead. — [Refactoring UI: 7 practical tips for cheating at design](https://medium.com/refactoring-ui/7-practical-tips-for-cheating-at-design-40c736799886)
- NN/g also notes that aesthetics affect perceived usability: users form an aesthetic first impression in about 50 ms, and "attractive things work better" (Don Norman). — [NN/g: Aesthetic and Minimalist Design](https://www.nngroup.com/articles/aesthetic-minimalist-design/)

### Inferences
- For a bib collection, the bib artwork is the color and decoration. The UI should be monochrome (white and grey text on black), with at most one accent color reserved for the single primary action or selection state. This matches NN/g's dominant pattern and Apple's advice that monochrome apps can use the brand color as accent.
- Hierarchy can come almost entirely from the system text styles (for example Large Title for the collection name, Headline for the race name, Subhead or Footnote in secondaryLabel for date and time), plus bib image size. No borders or shadows are needed.
- "One primary action per screen" is a heuristic. Apple says "one or two prominent buttons", not strictly one.

### Gaps
- Refactoring UI's original text could not be fetched (Medium blocked by Cloudflare). Its claims above rest on a search-engine summary of that page.
- No NN/g study specific to minimalism on mobile apps, as opposed to websites, was found. The 2015 study is web-only and old.

---

## 4. Dark UI best practices: pure black vs near black, contrast, grey text on black, elevation

### Takeaway
Pure black (#000000) is Apple's own Dark Mode base background and is legitimate. Its drawbacks are OLED "black smear" during scrolling and the loss of shadow-based elevation. Near-black (#121212, Material's choice) reduces both. On black, express elevation with lighter surfaces, not shadows, and keep text at least 4.5:1, aiming for 7:1. Mid-grey below about #767676 fails on pure black.

### Cited Findings
- Apple's `systemBackground` in Dark Mode is pure black, while secondary and tertiary backgrounds are grey shades for hierarchy. — [mackuba WWDC19 notes **[older]**](https://mackuba.eu/notes/wwdc19/implementing-dark-mode-ios/). Elevated backgrounds (sheets, popovers) are "brighter", so foreground interfaces advance. — [HIG: Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode)
- **[older, 2019]** OLED smear: "when you're scrolling through the content in a black background, the pixels find it hard to keep pace with your scrolling, resulting in a smear." LookUp's fix was "a dark enough grey that it appears black in use", which still uses much less power than white. — [MacStories](https://www.macstories.net/linked/designing-a-dark-theme-for-oled-iphones/); [Michael Tsai](https://mjtsai.com/blog/2019/05/15/designing-a-dark-theme-for-oled-iphones)
- Material (Google): dark theme surfaces are dark grey (baseline #121212), not black. Elevation is shown by lighter surfaces, since "shadows… appear to be less visible" on dark backgrounds, so "surfaces become lighter… at higher elevations." This uses semi-transparent overlays, now replaced in M3 by tonal surface colors. — [Material Components Android: Dark theme docs](https://raw.githubusercontent.com/material-components/material-components-android/master/docs/theming/Dark.md)
- Material 2 says dark surfaces with 100% white body text reach at least 15.8:1. Primary colors are desaturated so they meet WCAG AA at every elevation. Seen via search summary because the page is JS-rendered. — [Material Design 2: Dark theme](https://m2.material.io/design/color/dark-theme)
- WCAG 2.2 SC 1.4.3 (AA): text at least 4.5:1; large text (18 pt, or 14 pt bold) at least 3:1. Values are not rounded, so 4.499:1 fails. — [W3C: Understanding 1.4.3](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html)
- WCAG 2.2 SC 1.4.11: UI components, states and meaningful graphics at least 3:1 against adjacent colors (inactive components exempt). — [W3C: Understanding 1.4.11](https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast.html)
- Apple's Accessibility Inspector uses WCAG AA: up to 17 pt, 4.5:1; 18 pt and up, 3:1; bold, 3:1. Apple also mentions APCA as an alternative measure. If defaults fall short, provide a higher-contrast scheme under Increase Contrast. — [HIG: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)
- Apple's own target: at least 4.5:1, and 7:1 for custom colors and small text. — [HIG: Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode)
- Avoid the quaternary label vibrancy on thin and ultra-thin materials "because the contrast is too low." — [HIG: Materials](https://developer.apple.com/design/human-interface-guidelines/materials)
- **[older, 2020]** Research review (NN/g, no own study): for people with normal vision, light mode (positive polarity) gives better acuity and proofreading. "The smaller the font, the better it is for users to see the text in light mode." At night, small text in dark mode was much harder to read in glanceable tasks (MIT AgeLab). Some people with cataracts do better in dark mode. — [NN/g: Dark Mode vs. Light Mode](https://www.nngroup.com/articles/dark-mode/)
- Computed WCAG contrast ratios on pure black (own calculation with the WCAG relative-luminance formula, not from a source):

  | Text color | On #000000 | On #121212 | On #1C1C1E |
  |---|---|---|---|
  | #FFFFFF | 21:1 | 18.7:1 | 17.0:1 |
  | #999999 (about 60% white) | 7.4:1 | 6.6:1 | 6.0:1 |
  | #8E8E93 | 6.4:1 | 5.8:1 | 5.2:1 |
  | #767676 | 4.6:1 (passes) | 4.1:1 (fails) | 3.8:1 (fails) |
  | #666666 | 3.7:1 (fails body text) | 3.3:1 | 3.0:1 |
  | #4D4D4D | 2.5:1 | 2.2:1 | 2.0:1 |
  | #333333 | 1.7:1 | 1.5:1 | 1.4:1 |

### Inferences
- Pure black is fine, and on iOS it is what `systemBackground` already is in Dark Mode. Using `Color(.systemBackground)` or `.black` gives true black, and sheets get the system's elevated grey automatically. If scrolling bib grids shows smear on OLED iPhones, a near-black such as #0A0A0A to #121212 is the documented mitigation. This needs testing on a device.
- Pure white text on pure black (21:1) can feel harsh for long reading. Using `label` for titles and `secondaryLabel` for metadata gives softer but still compliant text (about 7:1 if secondaryLabel is about 60% white; unverified).
- Grey text below about #777 on black fails WCAG for body text. Treat #666 and darker as decorative only (dividers, disabled states), never for information.
- On black, bib "cards" don't need shadows. If grouping is needed, a slightly lighter surface (secondary or elevated background) or simply spacing works better.
- NN/g's polarity findings argue for keeping text large: for an app that is dark by design, use body text at 17 pt or larger and avoid Caption 2 (11 pt) for important data.

### Gaps
- No controlled measurement of OLED smear visibility (black vs #0A0A0A vs #121212) on current iPhone panels (ProMotion, LTPO) was found. Evidence is anecdotal and from 2018–2019.
- Apple's exact dark-mode hex values for secondary and tertiary label colors and backgrounds could not be verified from primary text.

---

## 5. Pitfalls of minimalism (hidden affordances, mystery meat navigation, low-contrast grey text, undiscoverable gestures)

### Takeaway
The recurring failure of minimalism is removing signifiers, labels and contrast along with the clutter. Users then spend more time and fixations looking for what's clickable, find less content behind hidden menus, and miss gesture-only features. Every primary function needs a visible, labeled, sufficiently contrasting control. Gestures should be shortcuts, not the only path.

### Cited Findings
- **[older, 2017]** Eyetracking with 71 users: pages with weak clickability signifiers needed 22% more time and 25% more fixations to find the target (p < 0.05). Flat UIs work when there is "low information density, traditional or consistent layout, and… important interactive elements… stand out", ideally all three. (Kate Moran) — [NN/g: Flat UI Elements Attract Less Attention](https://www.nngroup.com/articles/flat-ui-less-attention-cause-uncertainty/)
- "Flat designs often fail to communicate to users which elements are selectable or clickable… a better approach is a compromise… a mostly flat design, but with clickable elements that users can recognize easily." Ghost buttons "can have legibility problems." — [NN/g: Characteristics of Minimalism](https://www.nngroup.com/articles/characteristics-minimalism/)
- **[older, 2016]** Hidden navigation: on mobile, people used hidden navigation in 57% of cases versus 86% for combo (partly visible) navigation. Content discoverability dropped more than 20%. Mobile tasks were 15% slower than with combo navigation, and perceived difficulty rose 21% versus visible navigation. — [NN/g: Hamburger Menus and Hidden Navigation](https://www.nngroup.com/articles/hamburger-menus/)
- Mystery meat navigation: "the target of each link is not visible until the user points their cursor at it… emphasizing aesthetic appearance, white space, and the concealment of information over practicality". The term was coined in 1998 by Vincent Flanders. — [Wikipedia: Mystery meat navigation](https://en.wikipedia.org/wiki/Mystery_meat_navigation)
- **[older, 2014]** "'Universal' icons are rare" (home, print and search are exceptions). "A text label must be present alongside an icon… Icon labels should be visible at all times." "Obscure icon = wasted feature." — [NN/g: Icon Usability](https://www.nngroup.com/articles/icon-usability/)
- **[older, 2015]** Low contrast: "Lured by the trend of minimalism, sites are abandoning their high-contrast traditions." Low contrast reduces discoverability, hurts low-vision and older users, and can look like disabled controls. "Low contrast text does look minimal… Don't lower your contrast, either." (Katie Sherwin) — [NN/g: Low-Contrast Text](https://www.nngroup.com/articles/low-contrast/)
- **[older, 2017]** Contextual swipe: "Lack of signifiers makes it unclear where the contextual swipe can be used… a general problem for gesture-based interactions." Inconsistent support across apps slows learning, and the revealed actions can hide content. — [NN/g: Contextual Swipe](https://www.nngroup.com/articles/contextual-swipe/)
- Apple: "Offer alternatives to gestures… if you use a swipe gesture to dismiss a view, also make a button available." "Prefer system gestures and behaviors people are already familiar with over creating custom gestures." "Avoid custom multifinger and multihand gestures." — [HIG: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)
- Apple: "Don't disable or hide tab bar buttons." "If you hide the tab bar, people can forget which area of the app they're in." — [HIG: Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars). Toolbars: "Don't make people guess or experiment." Hidden toolbars must be reliably restorable. — [HIG: Toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars)
- Liquid Glass shows the same pitfalls at system level: an unlabeled back button, a pale floating search that is "easy to miss", and controls that "appear, vanish, collapse, and expand". — [NN/g: Liquid Glass Is Cracked](https://www.nngroup.com/articles/liquid-glass/)

### Inferences
- For the bib app, likely traps include: an icon-only "+" with no label, long-press as the only way to edit or delete a bib, swipe as the only way to move between bibs, mid-grey metadata (#555) on black, and hiding all controls for a pure gallery look without a reliable way back.
- Mitigation: keep visible, labeled entry points; use context menus (long-press) only as shortcuts duplicating a visible menu or button; and use SF Symbols with text labels in the tab bar, as the HIG requires.

### Gaps
- Most NN/g evidence here is web/desktop and from 2014–2017. No recent (2024–2026) quantitative study of gesture discoverability on iOS was found.

---

## 6. iOS accessibility basics (44 pt targets, Reduce Motion, VoiceOver, Dynamic Type)

### Takeaway
On iOS, controls should be 44×44 pt by default (28×28 pt minimum), text must scale with Dynamic Type to at least 200%, motion must give way under Reduce Motion, every control and image needs a VoiceOver label, and information can never be carried by color alone. System components and Liquid Glass provide much of this automatically.

### Cited Findings
- Control size: iOS default is 44×44 pt and minimum 28×28 pt. — [HIG: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility). "A button needs a hit region of at least 44x44 pt." — [HIG: Buttons](https://developer.apple.com/design/human-interface-guidelines/buttons)
- Dynamic Type: "Ideally, give people the option to enlarge text by at least 200 percent." The iOS minimum is 11 pt and the default 17 pt. — [HIG: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility). Test with Larger Accessibility Text Sizes, keep truncation low, switch to stacked layouts and fewer columns at large sizes, and scale meaningful icons along with text. — [HIG: Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
- Reduce Motion: when active, reduce "automatic and repetitive animations, including zooming, scaling, and peripheral motion." Suggested techniques: tighter springs, tracking gestures directly, no z-axis depth animation, replacing x/y/z transitions with fades, and "avoiding animating into and out of blurs." — [HIG: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)
- Liquid Glass under Reduced Motion "decreases the intensity of some effects and disables any elastic properties", and it adapts automatically to Reduce Transparency and Increase Contrast. — [WWDC25 Session 219](https://developer.apple.com/videos/play/wwdc2025/219/); [MacRumors iOS 27](https://www.macrumors.com/2026/06/10/how-liquid-glass-is-changing-in-ios-27/)
- VoiceOver: "Describe your app's interface and content for VoiceOver." Label interface elements for Voice Control and Switch Control. Use Accessibility Inspector to audit. Accessibility Nutrition Labels on the App Store (added June 2025) let developers declare supported features. — [HIG: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)
- "Convey information with more than color alone… Offer visual indicators, like distinct shapes or icons." — [HIG: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)
- Motion must not be the only way to convey information. Supplement it with haptics and audio. — [HIG: Motion](https://developer.apple.com/design/human-interface-guidelines/motion)
- Assistive Access: "Identify the core functionality of your app and consider removing noncritical workflows and UI elements." — [HIG: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)

### Inferences
- In a bib grid, each bib thumbnail is a tappable image and needs a VoiceOver label carrying the data (for example "Berlin Marathon 2025, bib 12345, finish time 3:21"), since the visual content is image-only.
- Grid layouts should drop to fewer columns at accessibility text sizes. Bib metadata overlays must not be fixed-size text.
- A minimalist look and accessibility don't conflict if the minimalism comes from fewer elements rather than smaller, fainter elements.

### Gaps
- The current HIG VoiceOver page itself (a separate page since March 2025) was not read in detail. Its specific rules on labels, traits and grouping for image grids are not captured here.

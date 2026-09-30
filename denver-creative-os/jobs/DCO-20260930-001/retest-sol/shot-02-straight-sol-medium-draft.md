<!-- Fresh Sol Medium SHOT-02 prompt draft (retest) -->
<!-- hermes_model: gpt-6.1-sol | reasoning: medium | session: 20260930_082040_74277f -->
<!-- Not a shipped prompt version; comparison artifact only. Do not overwrite prompts/shot-02-straight-v5.md -->
## JOB
Create a demo-only product image of the Fictional Oak Side Table for Denver Creative OS, using MANUAL_CHATGPT_IMAGES. This is a fictional product, not a representation of a verified commercial item.

## SHOT
SHOT-02-STRAIGHT: centered, straight-on front elevation with minimal perspective distortion. Prioritize a clear reading of the front-facing wooden body, leg spacing, overall proportions, and structural symmetry.

## SOURCE ANCHOR (IDENTITY + PROPORTION LOCK)
Use `source/product-reference.png` as the sole authority for product identity, construction, and proportions.

The reference shows a substantial, box-like light-wood body elevated on four slender, dark legs. The body is visibly deep from its top edge to its underside; it is not a thin tabletop or a shallow apron. The exposed legs provide the longer vertical portion of the product.

Translate the referenceΓÇÖs angled view into a front elevation without redesigning the object. Distinguish actual geometry from perspective: the broad visible top surface and receding left side are consequences of the source viewpoint, not instructions to enlarge the body or expose those surfaces in this shot.

Do not impose a numerical body-to-total-height ratio. Match the referenceΓÇÖs visual relationships among front width, wooden body height, exposed leg length, leg thickness, and attachment spacing.

## MUST PRESERVE
- Substantial rectangular wooden body with a flat top, straight edges, and the sourceΓÇÖs restrained edge treatment.
- Light, warm oak-like appearance with visible joined wood sections, varied grain direction, tonal variation, and occasional darker marks.
- Broad, uninterrupted front face. Do not invent drawers, handles, doors, shelving, or decorative panel divisions.
- Four slender dark wood-toned legs, preserving their taper, subtle outward stance, placement, and attachment beneath the body.
- Legs that remain narrow relative to the wooden body but retain visible thickness and material character; do not reduce them to hairline rods.
- The sourceΓÇÖs balance of a weighty wooden upper body and a light, open-legged lower structure.
- Structural symmetry without artificially mirroring the natural wood grain.

## SCENE
Use a plain neutral studio background with a continuous, solid matte floor. Keep the setting empty and unobtrusive.

Include only the table and its soft grounding shadow. No rug, sofa, wall decoration, styling objects, or items on the tabletop. Ensure the dark legs remain clearly distinguishable from the background.

## CAMERA
Place the camera directly in front of the product, aligned with the center of its front face. Keep the camera level, with no yaw, roll, or downward-looking angle.

Use an orthographic-like or long-lens product-photography appearance. Keep the front edges horizontal and the bodyΓÇÖs vertical edges upright, without wide-angle expansion or exaggerated convergence.

The front face should dominate. Show no meaningful side face and at most a minimal glimpse of the top consistent with a straight-on elevation. Do not tilt the camera to reveal the tabletop.

Center the entire product in the frame with comfortable margins. Include every foot. Preserve the sourceΓÇÖs leg arrangement; rear legs may be partly obscured or overlap naturally in this frontal projection. Do not spread them apart merely to display all four.

## LIGHTING
Use broad, soft studio illumination that reveals the wooden bodyΓÇÖs grain, joined sections, and front-face depth without harsh glare.

Provide sufficient fill to separate the dark legs from the backdrop and reveal their taper. Maintain the referenceΓÇÖs light-body/dark-leg contrast without crushing the legs to featureless black.

Keep the contact shadow subtle and physically plausible. Avoid dramatic directional shadows or lighting that obscures the silhouette.

## NEGATIVE / DO NOT
- No redesign, proportion correction, or substitution with a generic side table.
- No thin tabletop, shallow wooden skirt, elongated cabinet, or oversized block.
- No thick, chunky legs; no metal hairpins, cylindrical rods, or exaggerated pencil-point taper.
- No additional rails, stretchers, shelves, drawers, handles, hardware, or ornament.
- No exaggerated splay, widened leg spacing, or invented changes to the attachments.
- No three-quarter view, conspicuous side surface, broad top reveal, overhead viewpoint, or wide-angle distortion.
- No forced separation of naturally overlapping rear legs.
- No perfectly uniform wood texture, mirrored grain, glossy plastic finish, or orange color cast.
- No props, room furnishings, rug, text, logo, labels, dimensions, or watermark.
- No cropping of the body or feet.

## OUTPUT EXPECTATION
Produce one clean, realistic studio product image showing the complete fictional table in a centered front elevation.

Success means the same object remains recognizable through its substantial wooden body, slender dark tapered legs, material patterning, and source-derived proportionsΓÇöeven though the viewpoint has changed. Favor faithful geometry and legibility over decorative styling.

## BRIEF_COMPARE_TO_V5
- Keep v5ΓÇÖs strict reference matching, substantial wooden body, slender dark legs, and uncluttered setting.
- Replace the numerical body-height target with source-derived visual relationships; the angled reference does not justify a rigid front-elevation ratio.
- Replace ΓÇ£pencil/stick thinΓÇ¥ with slender legs of visible thickness, preserving their dark wood character and taper.
- SolΓÇÖs reading is broadly consistent with v5ΓÇÖs deep-body emphasis, but less extreme about leg thinness and more cautious about treating visible top depth as front-face height.
docker : 
At C:\Users\tommy\AppData\Local\Temp\ps-script-466dfc6d-8c90-42c6-91bd-b134634346e8.ps1:87 char:1
+ docker exec hermes hermes chat --query-file /opt/data/workspace/dco-2 ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 
session_id: 20260930_082040_74277f

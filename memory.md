# Clearance Project Handoff

## Project identity
- This folder is its own standalone Vite/React project:
  - `/Users/stuart914-420-8940/Documents/clearance-demo`
- It is separate from:
  - `/Users/stuart914-420-8940/Documents/nantucket-rental`

## Current structure
- App root files:
  - `package.json`
  - `vite.config.ts`
  - `tsconfig.json`
  - `tsconfig.app.json`
  - `tsconfig.node.json`
  - `eslint.config.js`
  - `index.html`
- App source:
  - `src/main.tsx`
  - `src/App.tsx`
  - `src/pages/ClearancePage.tsx`
  - `src/features/clearance/components/ClearanceFrame.tsx`
- Served prototype:
  - `public/clearance-prototype.html`
- Static preview assets:
  - `public/preview-assets/*`
- Original standalone source retained:
  - `clearance-demo.html`

## Current architecture note
- The project is now a proper Vite app root.
- The current UI still renders through an iframe wrapper around the validated standalone prototype.
- This is intentional as an intermediate step to keep the working clearance behavior stable while restoring normal web-app structure.

## Next best-practice migration path
1. Extract submission data and UI state from `clearance-prototype.html`.
2. Port the submission table into React components first.
3. Port the five left-side subcards second.
4. Port the right preview shell/tabs last.
5. Remove the iframe only after behavior parity is verified.

## Behavioral requirements already established
- Left lower cards change only from submission selection.
- Right preview tabs change only the right preview.
- Clicking a selected submission again deselects it.
- Shift-click selects ranges.
- Up/down arrow keys move the selected submission.
- Left panel content scrolls as one region when page height is tight.
- Zoom +/- changes density for the submission list and all 5 lower left subcards together.
- Date fields should support both typing and native picker use.

# PRD: Denver Creative OS

## MVP: Hermes-Assisted Furniture \& Interiors Visual Production Workflow

**Disusun:** 30 September 2026  
**Status:** MVP product baseline — approved build direction, pre-implementation  
**Target build:** selesai dalam 1 hari kerja terfokus  
**Audiens:** Rommy, Cursor/Codex/Denver implementer, future pilot reviewer, creative/ecommerce stakeholders  
**Bahasa:** Indonesia untuk dokumentasi internal; istilah teknis dan creative-production standard dipertahankan dalam bahasa Inggris  
**Referensi struktur:** kerangka PRD PTO, tetapi seluruh scope, workflow, acceptance gate, dan arsitektur di dokumen ini khusus Denver Creative OS.

> Dokumen ini sengaja membedakan antara \*\*fakta yang sudah diverifikasi\*\*, \*\*keputusan MVP\*\*, dan \*\*hipotesis bisnis yang masih harus dibuktikan lewat pitch/pilot\*\*. Denver Creative OS V0 tidak boleh disebut production-ready, fully autonomous, atau cost-saving sebelum ada hasil pilot nyata.

\---

## 1\. Ringkasan Produk

**Denver Creative OS (DCO)** adalah workflow agent-assisted untuk mengubah **product reference/cutout + product constraints + shot requirements** menjadi:

1. structured product brief;
2. fidelity constraints;
3. repeatable shot plan;
4. generation prompt pack;
5. human-controlled image-generation checkpoint;
6. visual QA report;
7. revision prompt ketika output tidak lolos;
8. approved delivery package.

MVP pertama sengaja sangat sempit:

> \*\*Furniture Product-to-Lifestyle Visual Workflow menggunakan Hermes Agent sebagai reasoning/QA layer dan ChatGPT Images sebagai manual generation surface.\*\*

MVP tidak membuat image-generation API sendiri, tidak memakai n8n, tidak membutuhkan VPS, tidak membutuhkan database, tidak menjalankan FLUX lokal, dan tidak mencoba menjadi production DAM/CMS.

### 1.1 Product Thesis

**Old abstraction:**

```text
AI image job
  ↓
manual prompt
  ↓
generate
  ↓
lihat hasil
  ↓
prompt ulang berdasarkan feeling
  ↓
kirim gambar
```

Masalah:

```text
brief tidak terstruktur
+ product constraint mudah hilang
+ angle tidak konsisten
+ revision reason tidak tercatat
+ quality criteria berubah-ubah
+ output sulit direplikasi
```

**New abstraction:**

```text
product reference
      ↓
structured product constraints
      ↓
repeatable shot plan
      ↓
controlled prompt pack
      ↓
human generation checkpoint
      ↓
source-bound visual QA
      ↓
revision / approval
      ↓
delivery manifest
```

DCO tidak menjual “AI art”. DCO menguji thesis bahwa:

> \*\*creative image production dapat dibuat lebih repeatable dan auditable tanpa menghilangkan human creative control.\*\*

### 1.2 Target Akhir yang Relevan untuk Pitch

Untuk furniture/ecommerce brand:

```text
existing product asset
        ↓
repeatable lifestyle variants
        ↓
fidelity QA
        ↓
catalog-ready delivery
```

Untuk interiors/creative agency:

```text
agency creative direction
        ↓
remote AI production support
        ↓
controlled variants
        ↓
visual QA
        ↓
approved assets returned to agency
```

Production automation penuh bukan target V0.

\---

## 2\. Research \& Evidence Foundation

### 2.1 Problem yang Sedang Diuji

Dari brief furniture yang dianalisis, bentuk kebutuhan yang berulang adalah:

* existing product/cutout sudah tersedia;
* client membutuhkan lifestyle imagery;
* minimum beberapa angle;
* visual harus modern, photorealistic, high-resolution;
* product identity harus tetap terbaca;
* jika batch pertama berhasil, workflow berpotensi diulang ke produk lain.

Hipotesis produk:

> Masalah utamanya bukan hanya “generate gambar bagus”, tetapi membuat \*\*cara produksi\*\* yang cukup konsisten untuk dipakai berulang pada katalog.

### 2.2 Target Pitch — Evidence vs Hypothesis

Target bisnis pertama:

1. **Furniture/ecommerce brand seperti Nöa \& Nani**  
Target problem: scalable catalog/lifestyle image production.
2. **Interiors creative agency seperti In The White Room (ITWR)**  
Target problem: remote/overflow AI production capacity yang mengikuti creative direction agency.

Yang boleh diklaim:

* kedua kategori bisnis memang menggunakan visual furniture/interiors;
* ada public signal bahwa freelance/content production relevan;
* DCO dapat dibuat untuk menguji workflow tersebut.

Yang **tidak boleh** diklaim tanpa bukti:

* Alex/Nöa \& Nani pasti akan memutus agency;
* ITWR pasti sedang mencari AI image freelancer;
* DCO pasti memangkas biaya sekian persen;
* DCO pasti lebih cepat daripada workflow mereka sekarang;
* client akan menerima hasil AI sebagai pengganti photography.

### 2.3 Hermes sebagai MVP Agent Runtime

Hermes dipilih karena V0 membutuhkan reasoning, files, skills, persistent procedures, dan vision-assisted QA — bukan workflow graph besar.

Referensi resmi saat baseline ini dibuat:

* Hermes official repository: https://github.com/NousResearch/hermes-agent
* Installation: https://github.com/NousResearch/hermes-agent/blob/main/website/docs/getting-started/installation.md
* Providers: https://github.com/NousResearch/hermes-agent/blob/main/website/docs/integrations/providers.md
* Skills: https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/skills.md
* Creating skills: https://github.com/NousResearch/hermes-agent/blob/main/website/docs/developer-guide/creating-skills.md

Keputusan provider untuk MVP:

> \*\*OpenAI Codex melalui ChatGPT OAuth di Hermes\*\*, selama login dan vision test berhasil pada akun saat setup.

Catatan penting: dokumentasi Hermes menjelaskan jalur ChatGPT OAuth untuk Codex, tetapi semantics plan/quota tidak boleh diasumsikan. Setup Day-1 harus membuktikan bahwa reasoning dan vision tersedia di akun aktual.

\---

## 3\. Pernyataan Masalah

Workflow generative image manual biasanya kehilangan struktur di antara tahap:

```text
brief
↓
prompt
↓
generation
↓
visual judgment
↓
revision
↓
delivery
```

Masalah spesifik:

* product constraints hanya hidup di kepala operator/chat;
* prompt berubah tanpa versioning;
* alasan reject tidak terstruktur;
* tidak ada contract bahwa source identity harus dipertahankan;
* hasil cantik dapat lolos meskipun geometry produk berubah;
* angle requirement dapat terpenuhi secara visual tetapi tidak cocok dengan brief;
* candidate history sulit direview;
* client sulit melihat bahwa proses dapat diulang.

### 3.1 Problem V0 yang Dipilih

> “Bagaimana satu operator dapat memakai Hermes untuk mengubah product reference menjadi 3 shot yang terstruktur, meng-generate secara manual dengan ChatGPT Images, lalu menjalankan visual QA + revision loop yang repeatable tanpa mengeluarkan biaya Image API?”

\---

## 4\. Old Abstraction → New Abstraction

### 4.1 Old Abstraction

```text
Prompt manually
    ↓
Generate manually
    ↓
Looks good?
  ↙       ↘
yes       no
 ↓         ↓
send      improvise prompt
```

### 4.2 New Abstraction

```text
SOURCE PRODUCT
      ↓
HERMES INTAKE
      ↓
FIDELITY CONTRACT
      ↓
3-SHOT PLAN
      ↓
PROMPT PACK
      ↓
MANUAL CHATGPT IMAGES
      ↓
CANDIDATE FOLDER
      ↓
HERMES VISION QA
      ↓
PASS / REVISE
      ↓
DELIVERY PACKAGE
```

### 4.3 Target Improvement — HIPOTESIS, BUKAN FAKTA

Target V0:

* operator tidak menulis ulang brief setiap shot;
* semua candidate memiliki shot ID dan revision lineage;
* setiap reject memiliki alasan;
* source-fidelity violation menjadi blocker;
* 3 approved shots dapat ditelusuri ke product brief dan prompt version;
* incremental Image API spend = **US$0**.

Tidak ada klaim time/cost saving terhadap client sebelum pilot.

\---

## 5\. Tujuan \& Objektif

|Objective|Target V0|Cara ukur|
|-|-:|-|
|Setup agent runtime|Hermes dapat chat + tools + vision|smoke test|
|Zero new image API spend|0 paid Image API calls|manual audit|
|Structured product intake|1 valid `product-brief.yaml`|schema/checklist|
|Repeatable shot planning|3 required shots|shot-plan inspection|
|Prompt reproducibility|1 versioned prompt per shot/revision|file audit|
|Human generation control|generation selalu manual|workflow invariant|
|Visual QA|setiap candidate punya PASS/WARN/BLOCK findings|QA report|
|Revision traceability|failed candidate menghasilkan revision brief|artifact check|
|Delivery completeness|3 approved images + manifest|final package|
|One-day viability|end-to-end demo selesai dalam 1 focused day|checkpoint|

### 5.1 North Star MVP

> \*\*Satu product reference dapat melewati intake → 3-shot prompt pack → manual generation → visual QA → revision → 3 approved deliverables dengan artifact trail yang jelas.\*\*

\---

## 6\. Target Pengguna

### 6.1 Primary Operator

**Rommy / AI creative production specialist**

Kebutuhan:

* menghasilkan commercial imagery;
* mempertahankan product identity;
* bekerja cepat tanpa Image API spend;
* membuat proses yang dapat dipresentasikan sebagai sistem, bukan improvisasi prompt.

### 6.2 Target Client Type A — Furniture / Ecommerce Brand

Contoh problem:

* banyak SKU;
* existing cutout/product images;
* butuh lifestyle imagery dan variant angle;
* physical room shoot untuk seluruh SKU dapat menjadi mahal/lambat;
* membutuhkan consistency dan product fidelity.

### 6.3 Target Client Type B — Interiors / Creative Agency

Contoh problem:

* agency tetap memegang creative direction;
* workload visual dapat berubah;
* membutuhkan overflow/remote production support;
* membutuhkan output mengikuti brief dan quality bar;
* tidak ingin kehilangan approval authority.

### 6.4 Future Users — Tidak untuk V0

* ecommerce content manager;
* art director;
* catalog production team;
* external retoucher;
* brand QA reviewer;
* automated DAM/CMS integration.

\---

## 7\. Prinsip Produk Inti

1. **Product fidelity before beauty.**
2. **Human approval remains final authority.**
3. **Generation provider is replaceable.**
4. **No Image API dependency in V0.**
5. **No background browser automation of ChatGPT UI.**
6. **Prompt is an artifact, not disposable chat text.**
7. **Every reject has a reason.**
8. **Every approved image maps to a shot requirement.**
9. **Source asset is never silently modified or overwritten.**
10. **One agent, one workflow, one local workspace for V0.**
11. **Skill before custom plugin.** Use a Hermes project skill because the MVP is procedural and can be expressed with instructions + existing tools.
12. **No database until files stop being sufficient.**
13. **No n8n until an external deterministic integration actually exists.**
14. **No local image model requirement.**
15. **Stop before complexity.** The goal is pitch evidence, not production infrastructure.

\---

## 8\. Fitur Inti

### 8.1 MVP V0 — Build Now

|Feature|Status|User Story|
|-|-|-|
|Hermes local setup|PLANNED|Operator dapat menjalankan Hermes lokal.|
|ChatGPT/Codex OAuth|PLANNED|Hermes mendapat reasoning provider tanpa API key baru jika account supports it.|
|Vision smoke test|PLANNED|Hermes dapat membaca source/candidate image.|
|Project-local Hermes skill|PLANNED|DCO workflow dapat dipanggil secara repeatable.|
|Product intake|PLANNED|Source + product facts diubah menjadi brief terstruktur.|
|Fidelity contract|PLANNED|Must-preserve vs flexible elements tercatat.|
|3-shot planner|PLANNED|Angled/front/detail plan dibuat deterministik dari brief.|
|Prompt pack|PLANNED|Prompt per shot dibuat dan disimpan.|
|Manual generation checkpoint|PLANNED|Operator generate via ChatGPT Images app.|
|Candidate ingest|PLANNED|File hasil ditempatkan ke job folder.|
|Visual QA|PLANNED|Hermes membandingkan candidate dengan source/brief.|
|Revision planner|PLANNED|Candidate gagal menghasilkan targeted revision prompt.|
|Approval state|PLANNED|Final images ditandai APPROVED hanya setelah QA + human review.|
|Delivery manifest|PLANNED|Final package memuat assets dan traceability.|

### 8.2 V0.2 — Hanya Setelah MVP Berhasil

* helper script untuk `new-job`;
* contact sheet generator;
* simple HTML report;
* automatic image metadata extraction;
* thumbnail generation;
* batch manifest;
* optional git commit helper;
* optional second-model review.

### 8.3 Production Vision — Do Not Build Now

* image-generation API;
* batch queue;
* n8n integration;
* client portal;
* multi-user approval;
* asset database;
* DAM/CMS/Shopify integration;
* automatic cost accounting;
* cloud worker;
* automated background removal;
* local FLUX inference;
* distributed agent team;
* unattended generation loop.

\---

## 9\. User Flows

### 9.1 Flow A — Create Visual Job

1. Operator membuat folder job dari template.
2. Source product image ditempatkan ke `source/`.
3. Operator menyediakan known facts:

   * product class;
   * material;
   * colors;
   * dimensions jika diketahui;
   * must-preserve details;
   * client shot requirement;
   * desired visual world.
4. Hermes membaca source + facts.
5. Jika source tidak cukup jelas, status menjadi `NEEDS\_INPUT`.
6. Hermes membuat `product-brief.yaml`.
7. Human mengecek brief.
8. Job menjadi `BRIEF\_APPROVED`.

### 9.2 Flow B — Build Shot Plan

Dari brief yang approved:

```text
Shot 01 = ANGLED
Shot 02 = STRAIGHT\_ON
Shot 03 = MEDIUM\_CLOSE
```

Setiap shot memiliki:

* purpose;
* camera/framing;
* must-show;
* must-preserve;
* room/environment;
* lighting;
* forbidden redesigns;
* output expectation.

Hermes menulis `shot-plan.yaml`.

### 9.3 Flow C — Prompt Pack

Hermes menghasilkan:

```text
prompts/
├─ shot-01-angled-v1.md
├─ shot-02-front-v1.md
└─ shot-03-detail-v1.md
```

Prompt harus:

* menyebut source image sebagai anchor;
* mengulang fidelity constraints yang relevan;
* tidak mengubah geometry tanpa izin;
* mendefinisikan camera/framing;
* mendefinisikan lifestyle environment;
* melarang text/watermark/unrequested people;
* menyatakan visual QA expectations.

### 9.4 Flow D — Manual ChatGPT Image Generation

1. Hermes berhenti dengan status `AWAITING\_GENERATION`.
2. Operator membuka ChatGPT Images.
3. Operator upload source/reference yang sah.
4. Operator paste prompt shot.
5. Operator generate candidate.
6. Candidate disimpan ke:
`jobs/<id>/candidates/<shot-id>/`.
7. Operator mengulang sampai candidate cukup untuk QA.
8. Operator memberi instruksi ke Hermes untuk resume.

**Invariant:** Hermes V0 tidak mengotomatiskan browser ChatGPT dan tidak menembakkan Image API.

### 9.5 Flow E — Visual QA

Hermes menggunakan source + product brief + shot plan + candidate.

Untuk setiap candidate:

```text
SOURCE\_FIDELITY
GEOMETRY
MATERIAL\_COLOR
SHOT\_COMPLIANCE
LIGHTING\_REALISM
SCENE\_INTEGRATION
ARTIFACTS
COMMERCIAL\_USABILITY
```

Finding:

```text
PASS
WARN
BLOCK
```

Decision:

```text
APPROVE
REVISE
```

BLOCK pada source fidelity/geometry menyebabkan `REVISE`.

### 9.6 Flow F — Revision

Jika REVISE:

1. Hermes tidak menulis ulang seluruh creative direction dari nol.
2. Hermes menyebut apa yang harus dipertahankan.
3. Hermes menyebut hanya perubahan yang diperlukan.
4. Prompt baru diberi version:
`shot-01-angled-v2.md`.
5. Operator generate ulang manual.
6. Candidate baru masuk QA.

V0 membatasi revision loop default maksimum **2 cycles per shot** sebelum operator mengambil keputusan manual.

### 9.7 Flow G — Delivery

Setelah 3 shot approved:

```text
delivery/
├─ shot-01-angled.png
├─ shot-02-straight-on.png
├─ shot-03-medium-close.png
├─ DELIVERY\_MANIFEST.md
└─ QA\_SUMMARY.md
```

Delivery manifest memuat:

* job ID;
* product label;
* source reference;
* final files;
* prompt version;
* QA decision;
* known limitations;
* generation method = `MANUAL\_CHATGPT\_IMAGES`;
* incremental image API spend = `0`.

\---

## 10\. Trust \& QA Model

### 10.1 Source-of-Truth Hierarchy

Urutan authority:

1. actual source product/reference;
2. explicit client/operator constraints;
3. approved product brief;
4. shot plan;
5. aesthetic inference.

Aesthetic preference tidak boleh mengalahkan product identity.

### 10.2 Must-Preserve vs Flexible

**Must preserve** contoh:

* overall silhouette;
* headboard/footboard shape;
* number/position of rails;
* ladder position;
* material class;
* product colors;
* hardware/detail yang terlihat dan penting;
* proportion relationships.

**Flexible** contoh:

* room decor;
* wall color;
* textiles bukan bagian dari produk;
* plant/lamp/props;
* background view;
* ambient styling.

### 10.3 Human Authority

Hermes boleh:

* analyze;
* plan;
* criticize;
* propose revision;
* package.

Hermes tidak boleh:

* menyatakan final approval tanpa human confirmation;
* diam-diam mengganti source;
* menganggap hasil lebih “bagus” berarti lebih “akurat”;
* melakukan paid API call tanpa explicit approval.

\---

## 11\. Teknologi — Product-Level Summary

|Layer|V0 Decision|
|-|-|
|Agent runtime|**Hermes Agent**|
|Main reasoning provider|**OpenAI Codex via ChatGPT OAuth**, subject to successful account test|
|Vision QA|Hermes vision using the main Codex OAuth path if available|
|Image generation|**Manual ChatGPT Images**|
|Image generation API|**None**|
|Orchestration|Hermes project skill|
|State|Local folders + YAML/Markdown|
|Database|None|
|n8n|None|
|VPS|None|
|Docker|None required|
|Local image model|None|
|UI|Hermes CLI/Desktop + filesystem|
|Versioning|Git for docs/skills/templates; job artifacts may be gitignored|
|Secrets|Hermes auth store only; never repo|

### Provider Gate

Day-1 setup must prove:

```text
Hermes installed
→ ChatGPT/Codex OAuth succeeds
→ normal reasoning turn succeeds
→ source image can be inspected with vision
```

If any provider/vision step fails:

> \*\*STOP and report. Do not silently add OpenAI API key, OpenRouter key, or other paid provider.\*\*

\---

## 12\. Data Model Target — File-Based V0

### JOB

* `job\_id`
* `created\_at`
* `status`
* `product\_label`
* `generation\_mode`
* `source\_paths`
* `shot\_ids`

### PRODUCT\_BRIEF

* product class;
* known facts;
* must-preserve;
* flexible styling;
* unknowns;
* target audience/use;
* desired visual world.

### SHOT

* shot ID;
* shot type;
* camera/framing;
* purpose;
* must-show;
* constraints;
* prompt version.

### CANDIDATE

* file path;
* shot ID;
* candidate ID;
* prompt version;
* revision round.

### QA\_REPORT

* candidate;
* criterion findings;
* blocking violations;
* decision;
* revision instruction;
* human decision.

### DELIVERY\_MANIFEST

* approved files;
* lineage;
* known limitations;
* delivery timestamp;
* generation method.

\---

## 13\. Job Lifecycle

```text
CREATED
  ↓
INTAKE
  ↓
NEEDS\_INPUT ─────┐
  ↓              │
BRIEF\_APPROVED ←─┘
  ↓
SHOT\_PLAN\_READY
  ↓
PROMPT\_PACK\_READY
  ↓
AWAITING\_GENERATION
  ↓
CANDIDATES\_READY
  ↓
QA\_REVIEW
  ├──────────────→ REVISION\_REQUIRED
  │                    ↓
  │              AWAITING\_GENERATION
  │
  ↓
HUMAN\_APPROVAL
  ↓
APPROVED
  ↓
PACKAGED
```

Side state:

```text
ABORTED
```

\---

## 14\. Ruang Lingkup

### 14.1 In Scope V0

* one operator;
* local machine;
* one product per job;
* image source/reference;
* furniture/interiors use case;
* 3 shot types;
* one Hermes agent;
* one project skill;
* ChatGPT/Codex OAuth;
* vision QA;
* manual ChatGPT Images;
* up to 2 revision cycles/shot by default;
* local delivery package;
* one demo job.

### 14.2 Explicitly Out of Scope V0

* n8n;
* MCP;
* webhooks;
* automatic browser control;
* Image API;
* OpenRouter paid usage;
* VPS;
* cloud DB;
* Redis;
* Supabase;
* client login;
* multi-tenancy;
* role permissions;
* payment;
* Shopify/DAM/CMS;
* auto publishing;
* batch of hundreds of SKUs;
* local FLUX;
* fine-tuning/LoRA;
* custom vision model;
* fully autonomous approval;
* SLA;
* production security claims.

\---

## 15\. Kebutuhan Non-Fungsional

### 15.1 Cost

* incremental Image API spend V0 = US$0;
* no required paid infrastructure;
* existing ChatGPT subscription may be used within its actual plan limits;
* no automatic paid-provider fallback;
* record any accidental paid spend as a defect.

### 15.2 Reliability

* missing source → block;
* missing required shot → block delivery;
* source fidelity BLOCK → candidate cannot be approved;
* prompt files versioned;
* source files never overwritten;
* final delivery only from approved candidates.

### 15.3 Security \& Privacy

* no API keys committed;
* OAuth credentials remain in Hermes auth store;
* client/source files remain local except when operator intentionally sends them to the chosen model/service;
* use only assets the operator is authorized to process;
* do not use PPH/private client attachments as off-platform pitch collateral without permission;
* do not include confidential client data in demo repo.

### 15.4 AI Safety / Claim Discipline

* Hermes output is analysis, not objective proof of visual correctness;
* visual QA may miss subtle product differences;
* human final approval mandatory;
* unknown product detail stays `unknown`, never invented as fact;
* client-specific efficiency claims require measured pilot data.

### 15.5 Maintainability

* workflow instructions live in `SKILL.md`;
* templates live outside prompts;
* no custom Python plugin required for V0;
* any helper script must be optional, small, and independently removable.

\---

## 16\. MVP Acceptance Gate

### Functional

V0 passes only if one real demo job can:

* create structured product brief;
* generate exactly 3 shot plans;
* produce 3 versioned prompt files;
* stop at manual generation checkpoint;
* ingest candidate images;
* create QA report per candidate;
* reject a candidate when blocking fidelity issue exists;
* generate targeted revision prompt;
* record human approval;
* package 3 approved images + manifest.

### Provider

* Hermes installs successfully;
* `hermes doctor` has no blocking runtime error;
* OpenAI Codex / ChatGPT OAuth login succeeds;
* normal agent turn works;
* vision inspection works without adding a paid API key.

### Cost

* zero paid Image API calls;
* zero new VPS/database dependency;
* no hidden paid-provider fallback.

### Demo

A reviewer can understand the workflow from:

1. source/reference;
2. product brief;
3. shot plan;
4. prompt pack;
5. candidate;
6. QA decision;
7. revision;
8. final 3-shot package.

### Timebox

If implementation cannot reach the complete demo within one focused day:

> remove optional features before extending the deadline.

\---

## 17\. One-Day Roadmap

### Stage 0 — Environment Gate

* install/update Hermes;
* `hermes doctor`;
* login with `hermes model` → OpenAI Codex / ChatGPT OAuth;
* reasoning smoke test;
* vision smoke test.

### Stage 1 — Repository Scaffold

* create repo;
* add docs;
* add `skills/denver-creative-os/SKILL.md`;
* add templates;
* add `jobs/`;
* trust project skills using Hermes.

### Stage 2 — Core Skill

Implement one skill with procedures:

```text
INTAKE
PLAN
PROMPT
PAUSE
QA
REVISE
APPROVE
PACKAGE
```

No multi-agent split.

### Stage 3 — Demo Job

Use a product asset owned/generated/authorized for demo.

* intake;
* three shots;
* prompt generation;
* manual ChatGPT generation.

### Stage 4 — QA + Revision

* run vision QA;
* deliberately test at least one obvious mismatch if possible;
* create revision prompt;
* generate replacement;
* human approve.

### Stage 5 — Package + Evidence

* final package;
* QA summary;
* screenshot simple architecture;
* record checkpoint.

Then stop.

\---

## 18\. Business Model — Hypotheses Only

### Furniture / Ecommerce

Possible commercial model later:

* paid pilot per SKU;
* fixed package per product / 3–5 images;
* monthly catalog production retainer;
* high-volume batch pricing after measured throughput.

### Agency

Possible model later:

* remote freelance production support;
* overflow project rate;
* day rate / hourly;
* white-label AI asset production;
* retained production capacity.

No pricing is locked in V0.

\---

## 19\. Unit Economics / Development Budget

### 19.1 V0 Planning Assumption

Required new cash spend:

```text
Hermes              $0
Local filesystem     $0
Git                   $0
n8n                   not used
VPS                   not used
Image API             $0
Database              not used
Local GPU             not required
```

Existing ChatGPT subscription is treated as already-owned infrastructure, not as a new project expense.

### 19.2 Cost Metric to Capture Later

For a paid pilot measure:

* candidate generations per approved image;
* revision count;
* operator minutes per product;
* QA time;
* final approved assets/product;
* external API cost if API mode is later enabled.

\---

## 20\. Metrik Keberhasilan

### North Star

**One product → three approved commercial shots with traceable workflow and zero incremental Image API spend.**

### Supporting Metrics

* prompt versions/shot;
* candidates/shot;
* BLOCK findings;
* revision cycles;
* operator time/job;
* approved images/job;
* generation provider;
* incremental spend.

### Client Metrics — Future Only

Do not claim until measured:

* cost reduction;
* faster content production;
* fewer physical shoots;
* catalog throughput improvement;
* agency utilization improvement.

\---

## 21\. Risiko \& Mitigasi

|Risk|Impact|Mitigation V0|
|-|-|-|
|Hermes OAuth unavailable for account|blocks reasoning path|stop and report; do not add paid key automatically|
|Vision path unavailable|blocks QA|stop and report; no fake QA|
|ChatGPT image usage limit|slows demo|pause generation; no automatic API spend|
|AI changes product geometry|commercial failure|source-fidelity BLOCK + revision|
|Hermes over-approves attractive output|false confidence|mandatory human final approval|
|workflow becomes too complex|misses 1-day target|one skill, files only, no DB/n8n|
|demo uses client-confidential asset|outreach/legal risk|use owned/authorized demo asset|
|pitch overclaims automation|credibility risk|describe human-in-loop accurately|
|prompts drift across revisions|inconsistent output|versioned prompt files|
|QA becomes subjective essay|not repeatable|fixed PASS/WARN/BLOCK criteria|

\---

## 22\. Production-Grade Final State — Direction Only

Potential future state:

```text
product feed
    ↓
intake adapter
    ↓
creative agent
    ↓
generator provider
    ↓
automated + human QA
    ↓
approval workspace
    ↓
DAM / ecommerce
```

Possible future components:

* n8n for deterministic external integrations;
* Image API provider abstraction;
* cost-aware routing;
* queue;
* catalog database;
* team approval;
* client portal;
* batch orchestration;
* local/rented GPU path.

None are authorized for V0.

\---

## 23\. Falsification Criteria

The DCO approach should be reconsidered if:

1. agent QA does not meaningfully improve revision discipline;
2. source fidelity cannot be maintained with available image generator;
3. manual checkpoint adds more friction than a simple documented prompt workflow;
4. artifact trail is not useful during client review;
5. pitch targets only care about one-off creative images and not repeatability;
6. ChatGPT/Codex OAuth or vision is too unreliable for the operator environment;
7. client economics do not justify the human QA effort.

\---

## 24\. Open Questions

These questions do **not** block Day-1 MVP:

* preferred commercial pricing model;
* whether a client would provide its own image API later;
* whether agency/client needs PSD/layered output;
* final color-management requirements;
* exact catalog resolution/export specs;
* whether a future local FLUX path is economical;
* whether n8n is needed after external integrations appear.

Blocking question policy:

> If implementation discovers a requirement that forces paid API spend, browser automation, client data upload, or a production database, stop and ask Rommy before proceeding.

\---

## 25\. Source Registry — Key Technical References

* Hermes official repository  
https://github.com/NousResearch/hermes-agent
* Hermes installation  
https://github.com/NousResearch/hermes-agent/blob/main/website/docs/getting-started/installation.md
* Hermes AI providers / ChatGPT OAuth  
https://github.com/NousResearch/hermes-agent/blob/main/website/docs/integrations/providers.md
* Hermes skills  
https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/skills.md
* Hermes skill authoring  
https://github.com/NousResearch/hermes-agent/blob/main/website/docs/developer-guide/creating-skills.md
* ITWR Work With Us  
https://inthewhiteroom.com/work-with-us
* ITWR photography/video capability  
https://inthewhiteroom.com/photography-video

\---

## 26\. Documentation Governance

Documents that govern V0:

1. `PRD\_DENVER\_CREATIVE\_OS.md`
2. `DENVER\_CREATIVE\_OS\_ARCHITECTURE\_AND\_REPO\_BLUEPRINT.md`
3. `DENVER\_CREATIVE\_OS\_DOCS\_README.md`

Implementation must not silently widen scope.

After Cursor/Codex setup:

* record actual Hermes version;
* record setup result;
* record OAuth/vision test result;
* record deviations from this baseline;
* update `CURRENT\_CHECKPOINT.md` if created by implementer.

Any change that introduces:

* paid API;
* n8n;
* custom plugin;
* DB;
* unattended browser automation;
* cloud deployment;

requires explicit Rommy approval before implementation.


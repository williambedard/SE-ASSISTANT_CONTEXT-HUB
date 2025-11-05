# Technical Assessment Template

## Template Overview
This template is used for creating Technical Assessment documents for merchant opportunities. Each new document should follow this EXACT structure with all sections, emojis, and formatting preserved.

**⚠️ IMPORTANT: This is a simplified markdown reference for human readability.**

For programmatic document creation with **complete formatting preservation** (tables, colors, fonts, borders), use the companion file:
- **`technical-assessment-template.json`** - Contains full formatting specifications including:
  - Table structures with exact styling (colors, borders, column widths)
  - Text formatting (bold, italic, colors, backgrounds, font sizes)
  - Section heading styles with background colors
  - All visual formatting details needed for Google Docs API

**When to use which:**
- **Use this markdown file** → Quick human reference, understanding structure
- **Use the JSON file** → Creating new Google Docs programmatically, preserving exact formatting

## Document Title Format
```
NEW [Account_Name] Technical Assessment - AMER/APAC - XS, Retail, B2B, MM, LA
```

## Document Structure

### Header Section
```
Technical Assessment
Opportunity Name: 
Notebook LM: 
Salesforce Opportunity Link: 
```

---

### Section 1: 🤝 Stakeholders & Key Player Matrix

**Section Header:**
```
🤝 Stakeholders & Key Player Matrix
```

**Description:**
```
This section contains all contact information (names, roles, email, phone numbers) on the opportunity, alongside a key player matrix (KPM), which is a visual representation of stakeholders and their influence, interest, and involvement in the project. It also includes additional context on the merchant & partner relationships.
```

**Additional Context Field:**
```
Other Merchant and Partner Relationship Context:
```

---

### Section 2: 🤔 Why Shopify / Why Now ?

**Section Header:**
```
🤔 Why Shopify / Why Now ?
```

**Description:**
```
This section explores the merchant's current challenges and motivations for change. It covers the specific pain points they're experiencing (such as platform limitations, poor performance, technical debt, or high maintenance costs) that have driven them to explore alternative solutions like Shopify.
```

---

### Section 3: 🧠 Requirements and Solutions

**Section Header:**
```
🧠 Requirements and Solutions
```

**Description:**
```
This section contains all merchant requirements and their proposed solutions. Every solution mentioned or discussed is outlined below, and includes discussions with the product team, partners, and applicable vault projects as well.
```

**Additional Context Field:**
```
Other Requirements and Solutions Context:
```

---

### Section 4: 🏋️ Data Migration

**Section Header:**
```
🏋️ Data Migration
```

**Description:**
```
This section provides insight into the data and elements that the merchant plans to transfer, along with any approximate figures shared. This may include the number of products, orders, customers, gift cards, and blogs involved. Additionally, it discusses the migration method to be used, whether through CSV files, manual entry, third-party applications, or ERP connectors and integrations, as determined by prior discussions.
```

**Additional Context Field:**
```
Other Data Migration Concerns:
```

---

### Section 5: 🔌 Tech Stack and Integrations

**Section Header:**
```
🔌 Tech Stack and Integrations
```

**Description:**
```
This section outlines the current systems and applications the merchant uses to operate their business. It also details the systems and applications that will be employed once the business transitions to Shopify.
```

**Additional Context Field:**
```
Other Tech Stack components, Integration Concerns, or suggested Shopify Apps:
```

---

### Section 6: 📝 Additional Notes

**Section Header:**
```
📝 Additional Notes
```

**Description:**
```
This space contains additional documents, links, notes and context on the merchant's project. It includes internal discussion notes and screenshots, project timeline, decks, presentations, architecture diagrams, etc.
```

---

### Section 7: Meeting Summaries & Transcripts

**Section Header:**
```
Meeting Summaries & Transcripts
```

**Description:**
```
This space contains all the meeting transcripts and summaries between the merchant, the Shopify team, and partners. This is where LLM models and workflows may insert recorded meeting notes automatically.
```

---

## Usage Instructions

When generating a new Technical Assessment document from this template:

1. **Replace Title Variables:**
   - Replace `[Account_Name]` with the actual merchant/account name
   - Keep the region and segment tags (AMER/APAC - XS, Retail, B2B, MM, LA) or modify as needed

2. **Fill Header Fields:**
   - Opportunity Name: [Insert opportunity name]
   - Notebook LM: [Insert NotebookLM link if available]
   - Salesforce Opportunity Link: [Insert SFDC link]

3. **Maintain Section Structure:**
   - Keep all emoji headers exactly as shown
   - Keep all section descriptions intact
   - Keep all "Other [context]" fields

4. **Content Population:**
   - Add content under each section as research/discovery progresses
   - Fill in the "Other [context]" fields with additional relevant information
   - Add meeting notes to the final section

5. **Formatting Notes:**
   - Preserve all line breaks and spacing
   - Keep emoji characters in headers
   - Maintain consistent formatting throughout

## Template Metadata
- **Source Document:** https://docs.google.com/document/d/1kJiqqnPB58nx4G-HiPzpAMS3ujIdAAnOUWnttW4qr9o/edit
- **Template Type:** Technical Assessment
- **Companion File:** `technical-assessment-template.json` (for programmatic creation with full formatting)
- **Last Updated:** November 4, 2025
- **Use Case:** Merchant opportunity technical evaluation and documentation

## Creating New Documents Programmatically

To create a new Technical Assessment document in Google Drive with proper formatting:

1. **Read the JSON template**: `technical-assessment-template.json`
2. **Use the gworkspace-mcp tool**: `batch_workspace_operations` or `create_file`
3. **Apply formatting from JSON**: Use the styles, tables, and formatting specs in the JSON
4. **Reference this markdown**: For understanding section purpose and content guidelines

**Example workflow:**
```
1. Create new Google Doc with title from JSON template
2. Apply HEADING_1 style with yellow background (#d0f136) to section headers
3. Insert tables with specifications from JSON (colors, borders, column widths)
4. Add section descriptions and "Other Context" fields
5. Use this markdown to understand what content goes in each section
```


# Technical Assessment Template System

## Overview
This directory contains template specifications for creating Technical Assessment documents for merchant opportunities. The templates preserve the exact structure and formatting from the source Google Doc.

## Files in This Directory

### 1. `technical-assessment-template.md`
**Purpose:** Human-readable reference for document structure and content guidelines

**Use this when:**
- You need to understand what sections exist
- You want to see section descriptions and purposes
- You're manually reviewing the structure
- You need quick reference without formatting details

**Contents:**
- Complete section listing with emojis and titles
- Section descriptions
- Content guidelines for each section
- Usage instructions

---

### 2. `technical-assessment-template.json`
**Purpose:** Complete formatting specification for programmatic document creation

**Use this when:**
- Creating new Google Docs via `batch_workspace_operations` API
- You need exact formatting (tables, colors, fonts, borders)
- Pushing documents back to Google Drive
- Automated document generation

**Contents:**
- Table structures (rows, columns, headers, styling)
- Color codes (#d0f136 for yellow backgrounds, #6b7178 for gray text, etc.)
- Font sizes and text formatting
- Border styles and column widths
- Complete style definitions

**Important:** 
- Fields prefixed with underscore (`_METADATA`, etc.) are **documentation only**
- **DO NOT** include underscore-prefixed fields in the actual document
- Only use: `documentTitle`, `sections`, `styles` for document creation

---

## Quick Start Guide

### For AI Assistants in New Context Windows

When asked to **create a new Technical Assessment document**:

1. **Read both files:**
   ```
   - Read technical-assessment-template.md for structure understanding
   - Read technical-assessment-template.json for formatting specifications
   ```

2. **Understand the structure:**
   - 7 main sections (Stakeholders, Why Shopify, Requirements, Data Migration, Tech Stack, Additional Notes, Meeting Transcripts)
   - Each section has specific emojis, titles, and descriptions
   - Some sections include complex tables with specific styling

3. **Apply formatting:**
   - HEADING_1 sections have yellow backgrounds (#d0f136)
   - Tables have specific header colors and styles (see JSON)
   - Maintain exact emoji placement
   - Use prescribed color schemes

4. **Use the gworkspace-mcp tools:**
   ```javascript
   // Create document
   create_file(title, "document")
   
   // Then use batch_workspace_operations to:
   // - Add formatted headers
   // - Insert tables with styling
   // - Apply text formatting
   ```

---

## Source Document
**Original Template:** https://docs.google.com/document/d/1kJiqqnPB58nx4G-HiPzpAMS3ujIdAAnOUWnttW4qr9o/edit

This is the authoritative source. If discrepancies arise, refer to this document.

---

## Key Formatting Specifications

### Colors Used
- **Yellow highlight background:** `#d0f136` (for all HEADING_1 sections)
- **Gray table headers:** `#d9d9d9` or `#f3f3f3`
- **Gray text:** `#6b7178`
- **White background:** Default

### Tables
The template includes **5 tables** with specific structures:

1. **Stakeholders Table** (5 rows × 4 columns)
   - Headers with icons: Person, Dropdown, Dropdown, Text field
   - Gray header background: `#f1f3f4`

2. **Requirements Table** (4 rows × 3 columns)
   - Headers: Requirement, Use Case TLDR, Proposed Solution
   - Row 2 has special styling (italic, light gray)

3. **Data Migration Table** (7 rows × 5 columns)
   - Headers: Data Type, Migration Required?, Current System, Recommended Solution, Est. Number
   - Data type rows have gray backgrounds: `#efefef`

4. **Tech Stack Table** (11 rows × 3 columns)
   - Fixed column widths: [216.75, 152.25, 185.25] PT
   - Headers: System, Current Solution, Proposed Solution

---

## Document Structure Summary

```
📄 Technical Assessment Document
│
├── 📋 Header Fields
│   ├── Opportunity Name
│   ├── Notebook LM
│   └── Salesforce Opportunity Link
│
├── 🤝 Stakeholders & Key Player Matrix
│   ├── [Table: 5×4 with styled headers]
│   └── Other Merchant and Partner Relationship Context
│
├── 🤔 Why Shopify / Why Now ?
│   └── [Free text section]
│
├── 🧠 Requirements and Solutions
│   ├── [Table: 4×3 with styled headers]
│   └── Other Requirements and Solutions Context
│
├── 🏋️ Data Migration
│   ├── [Table: 7×5 with data type rows]
│   └── Other Data Migration Concerns
│
├── 🔌 Tech Stack and Integrations
│   ├── [Table: 11×3 with system categories]
│   └── Other Tech Stack components, Integration Concerns, or suggested Shopify Apps
│
├── 📝 Additional Notes
│   └── [Free text section for docs, links, notes]
│
└── 📅 Meeting Summaries & Transcripts
    └── [Free text section for meeting notes]
```

---

## Usage Examples

### Example 1: Creating a New Document
```markdown
User: "Create a Technical Assessment for Acme Corp"

Steps:
1. Read technical-assessment-template.json
2. Create new Google Doc: "NEW Acme Corp Technical Assessment - AMER/APAC - XS, Retail, B2B, MM, LA"
3. Apply TITLE style to document title
4. For each section:
   - Add emoji + title with HEADING_1 style (yellow background)
   - Add description with SUBTITLE style
   - Insert tables with formatting from JSON
   - Add "Other Context" fields
```

### Example 2: Understanding Structure Only
```markdown
User: "What sections are in the Technical Assessment template?"

Steps:
1. Read technical-assessment-template.md
2. List the 7 main sections with their emojis and purposes
```

---

## Important Notes

1. **Always use both files together** when creating new documents
2. **JSON is the source of truth** for formatting
3. **Markdown is the source of truth** for content structure and guidelines
4. **Never guess at formatting** - refer to JSON specifications
5. **Preserve all emojis** exactly as shown
6. **Maintain table structures** with correct row/column counts

---

## Maintenance

**Last Updated:** November 4, 2025

**When to Update:**
- If the source Google Doc changes
- If new sections are added
- If formatting requirements change

**How to Update:**
1. Use `mcp_mcp_gworkspace-mcp_get_object` to fetch latest structure
2. Update JSON with new formatting specs
3. Update markdown with new section descriptions
4. Update this README if major changes occur

---

## Questions?

For issues or questions about this template system:
1. Verify against the source Google Doc
2. Check both template files for consistency
3. Refer to this README for guidance


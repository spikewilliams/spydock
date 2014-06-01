# -*- coding: utf-8 -*-
# <nbformat>3.0</nbformat>

# <codecell>

import xml.etree.ElementTree as et
import pandas as pd

# <markdowncell>

# In this example, we are parsing an XML file full of information on country names and ISO 3166 codes. Inside the file's root node there are elements that look like this:
# 
#         <iso_3166_entry
#                 alpha_2_code="AL"
#                 alpha_3_code="ALB"
#                 numeric_code="008"
#                 name="Albania"
#                 official_name="Republic of Albania" />

# <codecell>

tree = et.parse('/data/iso_3166.xml')
root = tree.getroot()
root

# <codecell>

entries = root.findall("iso_3166_entry")
data = []
for entry in entries:
    row = []
    row.append(entry.attrib["alpha_2_code"])
    row.append(entry.attrib["alpha_3_code"])
    row.append(entry.attrib["numeric_code"])
    row.append(entry.attrib["name"])
    if ("official_name" in entry.attrib):
        row.append(entry.attrib["official_name"])
    else:
        row.append(entry.attrib["name"]) 
    data.append(row)
    
pd.DataFrame(data)

# <codecell>



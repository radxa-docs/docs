---
sidebar_position: 2
description: "Explore Eclipse Mraa, a versatile I/O library for Linux"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_mraa.mdx
---

# Mraa Usage

import MRAA from '../../../common/dev/\_mraa.mdx';

<Tabs queryString="board">
    <TabItem value="ROCK 5B">
          <MRAA install_by_apt={true} />
    </TabItem>
    <TabItem value="ROCK 5B+">
        <MRAA install_by_source_code={true} branch="Add_Radxa_ROCK5B+_Support" />
    </TabItem>
</Tabs>

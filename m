Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4B234C94
	for <lists+cocci@lfdr.de>; Fri, 31 Jul 2020 23:01:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06VL0dq8021480;
	Fri, 31 Jul 2020 23:00:39 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4E4997807;
	Fri, 31 Jul 2020 23:00:39 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D6BAF4121
 for <cocci@systeme.lip6.fr>; Fri, 31 Jul 2020 23:00:36 +0200 (CEST)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06VL0ZcA015805
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 31 Jul 2020 23:00:36 +0200 (CEST)
Received: by mail-lj1-f195.google.com with SMTP id t6so20833382ljk.9
 for <cocci@systeme.lip6.fr>; Fri, 31 Jul 2020 14:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/j7iupmhc9JT5gKdbzmUb9JaFhkdwdq+aVyKAG2Hh4=;
 b=fHz7qTvwqvsHOgTz/kXWhCLChFqGAEmbS0a3kP2nCo25QmLoo8A4xY6w6QdaDR9MOS
 GKkNzrKTAGTrjSXcbtESqkyhNZIKHfvsZXnbR1kPzrnZhvfCa+E61P+SrYUR/CxJxB6E
 j8xNZe2zgZIhJxWnTU4H+waHYF0OpKPnAaju3S2yxmSmVc/4cB203t5sEbMTbmlL5zED
 bCLjcW5qIhv7PTFGxi22lkl6rhyuLG/RpG2/V2TpRg2a23LMpXUavenzC64D/JRiauHf
 bV195WGi6L8fkiHVt2UCW2ro8dHK7q4y77ITCvrORpuf8f6PGR0bdWrh7ETIAFJobPuk
 HwPw==
X-Gm-Message-State: AOAM531GvuYZlyP6ptlguY3qZwpX+tG214OJ8PuA8a27f6hzHuuTNjwI
 u+aF8dYG0cJWDQeFObmwRro=
X-Google-Smtp-Source: ABdhPJyU6HRZNhCt1HodRVlUYGmY7ZMaWk3rCkzeVitfbC2eSQ4q3KdZJhg14l9MlU4DFehMIbJfyw==
X-Received: by 2002:a2e:7019:: with SMTP id l25mr2350105ljc.256.1596229235438; 
 Fri, 31 Jul 2020 14:00:35 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id l26sm2185737lfj.22.2020.07.31.14.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 14:00:34 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sat,  1 Aug 2020 00:00:26 +0300
Message-Id: <20200731210026.7186-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605204237.85055-1-efremov@linux.com>
References: <20200605204237.85055-1-efremov@linux.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 31 Jul 2020 23:00:41 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 31 Jul 2020 23:00:36 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: [Cocci] [PATCH v6] coccinelle: api: add kvfree script
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Check that alloc and free types of functions match each other.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
Changes in v2:
 - Lines are limited to 80 characters where possible
 - Confidence changed from High to Medium because of 
   fs/btrfs/send.c:1119 false-positive
 - __vmalloc_area_node() explicitly excluded from analysis
   instead of !(file in "mm/vmalloc.c") condition
Changes in v3:
 - prints style in org && report modes changed for python2
Changes in v4:
 - missing msg argument to print_todo fixed
Changes in v5:
 - fix position p in kfree rule
 - move @kok and @v positions in choice rule after the arguments
 - remove kvmalloc suggestions
Changes in v6:
 - more asterisks added in context mode
 - second @kok added to the choice rule

 scripts/coccinelle/api/kvfree.cocci | 182 ++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 scripts/coccinelle/api/kvfree.cocci

diff --git a/scripts/coccinelle/api/kvfree.cocci b/scripts/coccinelle/api/kvfree.cocci
new file mode 100644
index 000000000000..f43cda5b0d5b
--- /dev/null
+++ b/scripts/coccinelle/api/kvfree.cocci
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Check that kvmalloc'ed memory is freed by kfree functions,
+/// vmalloc'ed by vfree functions and kvmalloc'ed by kvfree
+/// functions.
+///
+// Confidence: Medium
+// Copyright: (C) 2020 Denis Efremov ISPRAS
+// Options: --no-includes --include-headers
+//
+
+virtual patch
+virtual report
+virtual org
+virtual context
+
+@initialize:python@
+@@
+# low-level memory api
+filter = frozenset(['__vmalloc_area_node'])
+
+def relevant(p):
+    return not (filter & {el.current_element for el in p})
+
+@choice@
+expression E, E1;
+position kok, vok;
+@@
+
+(
+  if (...) {
+    ...
+    E = \(kmalloc\|kzalloc\|krealloc\|kcalloc\|
+          kmalloc_node\|kzalloc_node\|kmalloc_array\|
+          kmalloc_array_node\|kcalloc_node\)(...)@kok
+    ...
+  } else {
+    ...
+    E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|
+          vzalloc_node\|vmalloc_exec\|vmalloc_32\|
+          vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|
+          __vmalloc_node\)(...)@vok
+    ...
+  }
+|
+  E = \(kmalloc\|kzalloc\|krealloc\|kcalloc\|kmalloc_node\|kzalloc_node\|
+        kmalloc_array\|kmalloc_array_node\|kcalloc_node\)(...)@kok
+  ... when != E = E1
+      when any
+  if (\(!E\|E == NULL\)) {
+    ...
+    E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|
+          vzalloc_node\|vmalloc_exec\|vmalloc_32\|
+          vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|
+          __vmalloc_node\)(...)@vok
+    ...
+  }
+)
+
+@vfree depends on !patch@
+expression E;
+position k != choice.kok;
+position p;
+@@
+
+* E = \(kmalloc\|kzalloc\|krealloc\|kcalloc\|kmalloc_node\|
+*       kzalloc_node\|kmalloc_array\|kmalloc_array_node\|
+*       kcalloc_node\)(...)@k
+  ... when != if (...) { ... E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|vmalloc_exec\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|__vmalloc_node\)(...); ... }
+      when != is_vmalloc_addr(E)
+      when any
+* \(vfree\|vfree_atomic\|kvfree\)(E)@p
+
+@pvfree depends on patch exists@
+expression E;
+position k != choice.kok;
+@@
+
+  E = \(kmalloc\|kzalloc\|krealloc\|kcalloc\|kmalloc_node\|
+        kzalloc_node\|kmalloc_array\|kmalloc_array_node\|
+        kcalloc_node\)(...)@k
+  ... when != if (...) { ... E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|vmalloc_exec\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|__vmalloc_node\)(...); ... }
+      when != is_vmalloc_addr(E)
+      when any
+- \(vfree\|vfree_atomic\|kvfree\)(E)
++ kfree(E)
+
+@kfree depends on !patch@
+expression E;
+position v != choice.vok;
+position p;
+@@
+
+* E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|
+*       vmalloc_exec\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|
+*       __vmalloc_node_range\|__vmalloc_node\)(...)@v
+  ... when != !is_vmalloc_addr(E)
+      when any
+* \(kfree\|kzfree\|kvfree\)(E)@p
+
+@pkfree depends on patch exists@
+expression E;
+position v != choice.vok;
+@@
+
+  E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|
+        vmalloc_exec\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|
+        __vmalloc_node_range\|__vmalloc_node\)(...)@v
+  ... when != !is_vmalloc_addr(E)
+      when any
+- \(kfree\|kvfree\)(E)
++ vfree(E)
+
+@kvfree depends on !patch@
+expression E;
+position p, k;
+@@
+
+* E = \(kvmalloc\|kvzalloc\|kvcalloc\|kvzalloc_node\|kvmalloc_node\|
+*       kvmalloc_array\)(...)@k
+  ... when != is_vmalloc_addr(E)
+      when any
+* \(kfree\|kzfree\|vfree\|vfree_atomic\)(E)@p
+
+@pkvfree depends on patch exists@
+expression E;
+@@
+
+  E = \(kvmalloc\|kvzalloc\|kvcalloc\|kvzalloc_node\|kvmalloc_node\|
+        kvmalloc_array\)(...)
+  ... when != is_vmalloc_addr(E)
+      when any
+- \(kfree\|vfree\)(E)
++ kvfree(E)
+
+@script: python depends on report@
+k << vfree.k;
+p << vfree.p;
+@@
+
+msg = "WARNING: kmalloc is used to allocate this memory at line %s" % (k[0].line)
+coccilib.report.print_report(p[0], msg)
+
+@script: python depends on org@
+k << vfree.k;
+p << vfree.p;
+@@
+
+msg = "WARNING: kmalloc is used to allocate this memory at line %s" % (k[0].line)
+coccilib.org.print_todo(p[0], msg)
+
+@script: python depends on report@
+v << kfree.v;
+p << kfree.p;
+@@
+
+msg = "WARNING: vmalloc is used to allocate this memory at line %s" % (v[0].line)
+coccilib.report.print_report(p[0], msg)
+
+@script: python depends on org@
+v << kfree.v;
+p << kfree.p;
+@@
+
+msg = "WARNING: vmalloc is used to allocate this memory at line %s" % (v[0].line)
+coccilib.org.print_todo(p[0], msg)
+
+@script: python depends on report@
+k << kvfree.k;
+p << kvfree.p;
+@@
+
+msg = "WARNING: kvmalloc is used to allocate this memory at line %s" % (k[0].line)
+coccilib.report.print_report(p[0], msg)
+
+@script: python depends on org@
+k << kvfree.k;
+p << kvfree.p;
+@@
+
+msg = "WARNING: kvmalloc is used to allocate this memory at line %s" % (k[0].line)
+coccilib.org.print_todo(p[0], msg)
-- 
2.26.2

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

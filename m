Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E54B15EDC
	for <lists+cocci@lfdr.de>; Tue,  7 May 2019 10:11:57 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
          by isis.lip6.fr (8.15.2/lip6) with ESMTP id x478B4ts011574
          ; Tue, 7 May 2019 10:11:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2AB63774A;
	Tue,  7 May 2019 10:11:04 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B4D827649
 for <cocci@systeme.lip6.fr>; Tue,  7 May 2019 10:11:01 +0200 (CEST)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 by isis.lip6.fr (8.15.2/lip6) with ESMTP id x478Ap18028445
 for <cocci@systeme.lip6.fr>; Tue, 7 May 2019 10:10:52 +0200 (CEST)
X-pt: isis.lip6.fr
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 4160247459E102E887A2;
 Tue,  7 May 2019 16:10:49 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id x478AhC4054488;
 Tue, 7 May 2019 16:10:43 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019050716105055-10087609 ;
 Tue, 7 May 2019 16:10:50 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: linux-kernel@vger.kernel.org
Date: Tue, 7 May 2019 16:12:24 +0800
Message-Id: <1557216744-25339-1-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-05-07 16:10:50,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-05-07 16:10:37, Serialize complete at 2019-05-07 16:10:37
X-MAIL: mse-fl2.zte.com.cn x478AhC4054488
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 07 May 2019 10:11:06 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 07 May 2019 10:10:53 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: wang.yi59@zte.com.cn, Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr,
        Wen Yang <wen.yang99@zte.com.cn>
Subject: [Cocci] [PATCH] coccinelle: semantic patch for missing of_node_put
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

The call to of_parse_phandle()/of_find_node_by_name() ... returns a node
pointer with refcount incremented thus it must be explicitly decremented
after the last usage.

This SmPL is also looking for places where there is an of_node_put on
some path but not on others.

Suggested-by: Julia Lawall <Julia.Lawall@lip6.fr>
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: cocci@systeme.lip6.fr
---
 scripts/coccinelle/free/of_node_put.cocci | 133 ++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 scripts/coccinelle/free/of_node_put.cocci

diff --git a/scripts/coccinelle/free/of_node_put.cocci b/scripts/coccinelle/free/of_node_put.cocci
new file mode 100644
index 0000000..304293c
--- /dev/null
+++ b/scripts/coccinelle/free/of_node_put.cocci
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/// Find missing of_node_put
+///
+// Confidence: Moderate
+// Copyright: (C) 2018-2019 Wen Yang, ZTE.
+// Comments:
+// Options: --no-includes --include-headers
+
+virtual report
+virtual org
+
+@initialize:python@
+@@
+
+msg_prefix = "ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line "
+msg_suffix = ", but without a corresponding object release within this function."
+
+seen = set()
+
+def add_if_not_present (p1, p2):
+    if (p1, p2) not in seen:
+        seen.add((p1, p2))
+        return True
+    return False
+
+@r1 exists@
+local idexpression struct device_node *x;
+expression e, e1;
+position p1, p2;
+identifier f;
+statement S;
+type T;
+@@
+
+(
+x = f@p1(...);
+... when != e = (T)x
+    when any
+    when != true x == NULL
+    when != of_node_put(x)
+    when != of_get_next_parent(x)
+    when != of_find_matching_node(x, ...)
+    when != if (x) { ... of_node_put(x) ... }
+    when != if (x) { ... return x; }
+    when != v4l2_async_notifier_add_fwnode_subdev(<...x...>)
+    when != e1 = of_fwnode_handle(x)
+(
+if (x) { ... when forall
+         of_node_put(x) ... }
+|
+return x;
+|
+return of_fwnode_handle(x);
+|
+return@p2 ...;
+)
+&
+x = f(...)
+...
+if (<+...x...+>) S
+...
+of_node_put(x);
+)
+
+@script:python depends on report && r1@
+p1 << r1.p1;
+p2 << r1.p2;
+@@
+
+if(add_if_not_present(p1[0].line, p2[0].line)):
+  coccilib.report.print_report(p2[0], msg_prefix + p1[0].line + msg_suffix)
+
+@script:python depends on org && r1@
+p1 << r1.p1;
+p2 << r1.p2;
+@@
+
+cocci.print_main("acquired a node pointer with refcount incremented", p1)
+cocci.print_secs("needed of_node_put", p2)
+
+@r2 exists@
+local idexpression struct device_node *x;
+expression e, e1;
+position p1, p2;
+statement S;
+type T;
+@@
+
+x = @p1\(of_find_compatible_node\|of_find_node_by_name\|of_parse_phandle\|
+    of_find_node_by_type\|of_find_node_by_name\|of_find_all_nodes\|
+    of_get_cpu_node\|of_get_parent\|of_get_next_parent\|
+    of_get_next_child\|of_get_next_available_child\|of_get_next_cpu_node\|
+    of_get_compatible_child\|of_get_child_by_name\|of_find_node_opts_by_path\|
+    of_find_node_with_property\|of_find_matching_node_and_match\|of_find_node_by_phandle\|
+    of_parse_phandle\)(...);
+...
+if (x == NULL || ...) S
+... when != e = (T)x
+    when any
+    when != true x == NULL
+    when != of_node_put(x)
+    when != of_get_next_parent(x)
+    when != of_find_matching_node(x, ...)
+    when != if (x) { ... of_node_put(x) ... }
+    when != if (x) { ... return x; }
+    when != v4l2_async_notifier_add_fwnode_subdev(<...x...>)
+    when != e1 = of_fwnode_handle(x)
+(
+if (x) { ... when forall
+         of_node_put(x) ... }
+|
+return x;
+|
+return of_fwnode_handle(x);
+|
+return@p2 ...;
+)
+
+@script:python depends on report && r2@
+p1 << r2.p1;
+p2 << r2.p2;
+@@
+
+if(add_if_not_present(p1[0].line, p2[0].line)):
+  coccilib.report.print_report(p2[0], msg_prefix + p1[0].line + msg_suffix)
+
+@script:python depends on org && r2@
+p1 << r2.p1;
+p2 << r2.p2;
+@@
+
+cocci.print_main("acquired a node pointer with refcount incremented", p1)
+cocci.print_secs("needed of_node_put", p2)
-- 
2.9.5

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369E28F064
	for <lists+cocci@lfdr.de>; Thu, 15 Oct 2020 12:52:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09FApodf005847;
	Thu, 15 Oct 2020 12:51:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B2C8377BC;
	Thu, 15 Oct 2020 12:51:50 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 011594500
 for <cocci@systeme.lip6.fr>; Thu, 15 Oct 2020 12:51:47 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:544])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09FApkQ4027432
 for <cocci@systeme.lip6.fr>; Thu, 15 Oct 2020 12:51:47 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id n9so1662080pgt.8
 for <cocci@systeme.lip6.fr>; Thu, 15 Oct 2020 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=DXtYQwE3N7ZgPdwG23jIICPx5FHKPKD05kuRDHrrzi8=;
 b=TqCu0caPVGTmGnVO4jOmNXUSLMmZrilg8oXNP9FFc6gcHkazR0o3rndTs7sX9g+OSF
 7MqWOHwI+C4furdsYKp/2yzyywtIQha7l26lbSLBBrpXuWt5AodREhw+UqkOG+VsGy+Y
 j+Rw0KgktVyEzQL5mV6Fjvd0ZDGKbV1kO+7ZyVdbB5q+ko+61OEpnFxEHvVqkv1dsB5u
 s09yI6a+HBSN/6Lu8zNTo6VK+Yrcu1QYWEujt5aoZCWtiZsjNp0D7soWhkbtRX/2p+wv
 yQlvLII4OGT0hiQ9wEe8FBPlVXMt8xuB/Daw0JDiYSLnNy+SyB6GhIocwQd0cgfMktWg
 +PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=DXtYQwE3N7ZgPdwG23jIICPx5FHKPKD05kuRDHrrzi8=;
 b=GjIJIEucdZFP5W7tIEYySOwEoI3lAniH+INIk/1Uk7QJTgr2agLxsbZlRbc7cAJR9y
 02V1u3aZ2eWo631YoYbCTI07jGeZ2TT/BBYwlsJNDZH8g2bzc77RL8vWPyOPLZOjateB
 hYXMdF0qrlZsIGw9FFl379eGq/6NdZoP/RXYICMQS8KNHEK4UkneArgJF3kegZIA1zcV
 ZIkv/Y8UfHDcmDPdsKvka8HgsBAIsD2Rg5iATamCy9XTltlDU1VyMAYINYHmT0saOqOe
 LVae7h5ihZsau7q7HZf71f4i5jJCKV9/bCNjpD5eK9kjf1qcLSeGrYCbCBb7VyPEq62D
 aHIw==
X-Gm-Message-State: AOAM532OZqQZmlB2BF6Z2YNtA3nvNONBEe3LZPUC+PHlZpLKi8Kz29bm
 zJ73QeQxOupJ9Fz8gPiPRuM=
X-Google-Smtp-Source: ABdhPJxAzmNyeQv3b/PDY53+ZPtW6/E/UBvhxt/qHY2RQ4kPBJNsDuJ8VYi4gqmdKkgOWNYYzv5uWA==
X-Received: by 2002:a62:e706:0:b029:152:5364:f5e4 with SMTP id
 s6-20020a62e7060000b02901525364f5e4mr3530324pfh.71.1602759106078; 
 Thu, 15 Oct 2020 03:51:46 -0700 (PDT)
Received: from adolin ([49.207.198.246])
 by smtp.gmail.com with ESMTPSA id c15sm2843150pgg.77.2020.10.15.03.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 03:51:45 -0700 (PDT)
Date: Thu, 15 Oct 2020 16:21:40 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: Julia.Lawall@lip6.fr
Message-ID: <20201015105140.sj4dfy2eykkts2tn@adolin>
MIME-Version: 1.0
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 15 Oct 2020 12:51:55 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 15 Oct 2020 12:51:47 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: Gilles.Muller@lip6.fr, michal.lkml@markovi.net, nicolas.palix@imag.fr,
        cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: [Cocci] [PATCH V3] coccinelle: iterators: Add for_each_child.cocci
 script
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

While iterating over child nodes with the for_each functions, if
control is transferred from the middle of the loop, as in the case
of a break or return or goto, there is no decrement in the
reference counter thus ultimately resulting in a memory leak.

Add this script to detect potential memory leaks caused by
the absence of of_node_put() before break, goto, or, return
statements which transfer control outside the loop.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

----
Changes in V2:
- Add options --include-headers and --no-includes
- Add 'when forall` to rules for break and goto

Changes in V3:
- Add return case
---
 .../coccinelle/iterators/for_each_child.cocci | 358 ++++++++++++++++++
 1 file changed, 358 insertions(+)
 create mode 100644 scripts/coccinelle/iterators/for_each_child.cocci

diff --git a/scripts/coccinelle/iterators/for_each_child.cocci b/scripts/coccinelle/iterators/for_each_child.cocci
new file mode 100644
index 000000000000..bc394615948e
--- /dev/null
+++ b/scripts/coccinelle/iterators/for_each_child.cocci
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Adds missing of_node_put() before return/break/goto statement within a for_each iterator for child nodes.
+//# False positives can be due to function calls within the for_each
+//# loop that may encapsulate an of_node_put.
+///
+// Confidence: High
+// Copyright: (C) 2020 Sumera Priyadarsini
+// URL: http://coccinelle.lip6.fr
+// Options: --no-includes --include-headers
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@r@
+local idexpression n;
+expression e1,e2;
+iterator name for_each_node_by_name, for_each_node_by_type,
+for_each_compatible_node, for_each_matching_node,
+for_each_matching_node_and_match, for_each_child_of_node,
+for_each_available_child_of_node, for_each_node_with_property;
+iterator i;
+statement S;
+expression list [n1] es;
+@@
+
+(
+(
+for_each_node_by_name(n,e1) S
+|
+for_each_node_by_type(n,e1) S
+|
+for_each_compatible_node(n,e1,e2) S
+|
+for_each_matching_node(n,e1) S
+|
+for_each_matching_node_and_match(n,e1,e2) S
+|
+for_each_child_of_node(e1,n) S
+|
+for_each_available_child_of_node(e1,n) S
+|
+for_each_node_with_property(n,e1) S
+)
+&
+i(es,n,...) S
+)
+
+@ruleone depends on patch && !context && !org && !report@
+
+local idexpression r.n;
+iterator r.i,i1;
+expression e;
+expression list [r.n1] es;
+statement S;
+@@
+
+ i(es,n,...) {
+   ...
+(
+   of_node_put(n);
+|
+   e = n
+|
+   return n;
+|
+   i1(...,n,...) S
+|
+- return of_node_get(n);
++ return n;
+|
++  of_node_put(n);
+?  return ...;
+)
+   ... when any
+ }
+
+@ruletwo depends on patch && !context && !org && !report@
+
+local idexpression r.n;
+iterator r.i,i1,i2;
+expression e,e1;
+expression list [r.n1] es;
+statement S,S2;
+@@
+
+ i(es,n,...) {
+   ...
+(
+   of_node_put(n);
+|
+   e = n
+|
+   i1(...,n,...) S
+|
++  of_node_put(n);
+?  break;
+)
+   ... when any
+ }
+... when != n
+    when strict
+    when forall
+(
+ n = e1;
+|
+?i2(...,n,...) S2
+)
+
+@rulethree depends on patch && !context && !org && !report exists@
+
+local idexpression r.n;
+iterator r.i,i1,i2;
+expression e,e1;
+identifier l;
+expression list [r.n1] es;
+statement S,S2;
+@@
+
+ i(es,n,...) {
+   ...
+(
+   of_node_put(n);
+|
+   e = n
+|
+   i1(...,n,...) S
+|
++  of_node_put(n);
+?  goto l;
+)
+   ... when any
+ }
+... when exists
+l: ... when != n
+       when strict
+       when forall
+(
+ n = e1;
+|
+?i2(...,n,...) S2
+)
+
+// ----------------------------------------------------------------------------
+
+@ruleone_context depends on !patch && (context || org || report) exists@
+statement S;
+expression e;
+expression list[r.n1] es;
+iterator r.i, i1;
+local idexpression r.n;
+position j0, j1;
+@@
+
+ i@j0(es,n,...) {
+   ...
+(
+   of_node_put(n);
+|
+   e = n
+|
+   return n;
+|
+   i1(...,n,...) S
+|
+  return @j1 ...;
+)
+   ... when any
+ }
+
+@ruleone_disj depends on !patch && (context || org || report)@
+expression list[r.n1] es;
+iterator r.i;
+local idexpression r.n;
+position ruleone_context.j0, ruleone_context.j1;
+@@
+
+*  i@j0(es,n,...) {
+   ...
+*return  @j1...;
+   ... when any
+ }
+
+@ruletwo_context depends on !patch && (context || org || report) exists@
+statement S, S2;
+expression e, e1;
+expression list[r.n1] es;
+iterator r.i, i1, i2;
+local idexpression r.n;
+position j0, j2;
+@@
+
+ i@j0(es,n,...) {
+   ...
+(
+   of_node_put(n);
+|
+   e = n
+|
+   i1(...,n,...) S
+|
+  break@j2;
+)
+   ... when any
+ }
+... when != n
+    when strict
+    when forall
+(
+ n = e1;
+|
+?i2(...,n,...) S2
+)
+
+@ruletwo_disj depends on !patch && (context || org || report)@
+statement S2;
+expression e1;
+expression list[r.n1] es;
+iterator r.i, i2;
+local idexpression r.n;
+position ruletwo_context.j0, ruletwo_context.j2;
+@@
+
+*  i@j0(es,n,...) {
+   ...
+*break @j2;
+   ... when any
+ }
+... when != n
+    when strict
+    when forall
+(
+  n = e1;
+|
+?i2(...,n,...) S2
+)
+
+@rulethree_context depends on !patch && (context || org || report) exists@
+identifier l;
+statement S,S2;
+expression e, e1;
+expression list[r.n1] es;
+iterator r.i, i1, i2;
+local idexpression r.n;
+position j0, j3;
+@@
+
+ i@j0(es,n,...) {
+   ...
+(
+   of_node_put(n);
+|
+   e = n
+|
+   i1(...,n,...) S
+|
+  goto l@j3;
+)
+  ... when any
+ }
+... when exists
+l:
+... when != n
+    when strict
+    when forall
+(
+ n = e1;
+|
+?i2(...,n,...) S2
+)
+
+@rulethree_disj depends on !patch && (context || org || report) exists@
+identifier l;
+statement S2;
+expression e1;
+expression list[r.n1] es;
+iterator r.i, i2;
+local idexpression r.n;
+position rulethree_context.j0, rulethree_context.j3;
+@@
+
+*  i@j0(es,n,...) {
+   ...
+*goto l@j3;
+   ... when any
+ }
+... when exists
+ l:
+ ... when != n
+     when strict
+     when forall
+(
+ n = e1;
+|
+?i2(...,n,...) S2
+)
+
+// ----------------------------------------------------------------------------
+
+@script:python ruleone_org depends on org@
+i << r.i;
+j0 << ruleone_context.j0;
+j1 << ruleone_context. j1;
+@@
+
+msg = "WARNING: Function \"%s\" should have of_node_put() before return " % (i)
+coccilib.org.print_safe_todo(j0[0], msg)
+coccilib.org.print_link(j1[0], "")
+
+@script:python ruletwo_org depends on org@
+i << r.i;
+j0 << ruletwo_context.j0;
+j2 << ruletwo_context.j2;
+@@
+
+msg = "WARNING: Function \"%s\" should have of_node_put() before break " % (i)
+coccilib.org.print_safe_todo(j0[0], msg)
+coccilib.org.print_link(j2[0], "")
+
+@script:python rulethree_org depends on org@
+i << r.i;
+j0 << rulethree_context.j0;
+j3 << rulethree_context.j3;
+@@
+
+msg = "WARNING: Function \"%s\" should have of_node_put() before goto " % (i)
+coccilib.org.print_safe_todo(j0[0], msg)
+coccilib.org.print_link(j3[0], "")
+
+// ----------------------------------------------------------------------------
+
+@script:python ruleone_report depends on report@
+i << r.i;
+j0 << ruleone_context.j0;
+j1 << ruleone_context.j1;
+@@
+
+msg = "WARNING: Function \"%s\" should have of_node_put() before return around line %s." % (i, j1[0].line)
+coccilib.report.print_report(j0[0], msg)
+
+@script:python ruletwo_report depends on report@
+i << r.i;
+j0 << ruletwo_context.j0;
+j2 << ruletwo_context.j2;
+@@
+
+msg = "WARNING: Function \"%s\" should have of_node_put() before break around line %s." % (i,j2[0].line)
+coccilib.report.print_report(j0[0], msg)
+
+@script:python rulethree_report depends on report@
+i << r.i;
+j0 << rulethree_context.j0;
+j3 << rulethree_context.j3;
+@@
+
+msg = "WARNING: Function \"%s\" should have of_node_put() before goto around lines %s." % (i,j3[0].line)
+coccilib.report.print_report(j0[0], msg)
-- 
2.25.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

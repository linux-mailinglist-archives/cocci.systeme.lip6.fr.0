Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96228102976
	for <lists+cocci@lfdr.de>; Tue, 19 Nov 2019 17:33:17 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJGWjHI024656;
	Tue, 19 Nov 2019 17:32:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E056A77DC;
	Tue, 19 Nov 2019 17:32:44 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id ABD9974EC
 for <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 17:32:41 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJGWe6K001349
 for <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 17:32:41 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,218,1571695200"; d="scan'208";a="327283104"
Received: from palace.lip6.fr ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 19 Nov 2019 17:32:39 +0100
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 19 Nov 2019 16:56:57 +0100
Message-Id: <1574179017-23787-1-git-send-email-Julia.Lawall@lip6.fr>
X-Mailer: git-send-email 1.9.1
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 19 Nov 2019 17:32:48 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 19 Nov 2019 17:32:41 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Gilles Muller <Gilles.Muller@inria.fr>, cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH] Coccinelle: ptr_ret: drop PTR_ERR_OR_ZERO semantic
	patch
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

This mostly made changes that made the code harder
to read, so drop it.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/api/ptr_ret.cocci |   97 -----------------------------------
 1 file changed, 97 deletions(-)

diff --git a/scripts/coccinelle/api/ptr_ret.cocci b/scripts/coccinelle/api/ptr_ret.cocci
deleted file mode 100644
index e76cd5d..0000000
--- a/scripts/coccinelle/api/ptr_ret.cocci
+++ /dev/null
@@ -1,97 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-///
-/// Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
-///
-// Confidence: High
-// Copyright: (C) 2012 Julia Lawall, INRIA/LIP6.
-// Copyright: (C) 2012 Gilles Muller, INRIA/LiP6.
-// URL: http://coccinelle.lip6.fr/
-// Options: --no-includes --include-headers
-//
-// Keywords: ERR_PTR, PTR_ERR, PTR_ERR_OR_ZERO
-// Version min: 2.6.39
-//
-
-virtual context
-virtual patch
-virtual org
-virtual report
-
-@depends on patch@
-expression ptr;
-@@
-
-- if (IS_ERR(ptr)) return PTR_ERR(ptr); else return 0;
-+ return PTR_ERR_OR_ZERO(ptr);
-
-@depends on patch@
-expression ptr;
-@@
-
-- if (IS_ERR(ptr)) return PTR_ERR(ptr); return 0;
-+ return PTR_ERR_OR_ZERO(ptr);
-
-@depends on patch@
-expression ptr;
-@@
-
-- (IS_ERR(ptr) ? PTR_ERR(ptr) : 0)
-+ PTR_ERR_OR_ZERO(ptr)
-
-@r1 depends on !patch@
-expression ptr;
-position p1;
-@@
-
-* if@p1 (IS_ERR(ptr)) return PTR_ERR(ptr); else return 0;
-
-@r2 depends on !patch@
-expression ptr;
-position p2;
-@@
-
-* if@p2 (IS_ERR(ptr)) return PTR_ERR(ptr); return 0;
-
-@r3 depends on !patch@
-expression ptr;
-position p3;
-@@
-
-* IS_ERR@p3(ptr) ? PTR_ERR(ptr) : 0
-
-@script:python depends on org@
-p << r1.p1;
-@@
-
-coccilib.org.print_todo(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-
-@script:python depends on org@
-p << r2.p2;
-@@
-
-coccilib.org.print_todo(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on org@
-p << r3.p3;
-@@
-
-coccilib.org.print_todo(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on report@
-p << r1.p1;
-@@
-
-coccilib.report.print_report(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on report@
-p << r2.p2;
-@@
-
-coccilib.report.print_report(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on report@
-p << r3.p3;
-@@
-
-coccilib.report.print_report(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

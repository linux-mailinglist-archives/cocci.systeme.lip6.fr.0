Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF64136D8C
	for <lists+cocci@lfdr.de>; Fri, 10 Jan 2020 14:16:12 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00ADFro2010738;
	Fri, 10 Jan 2020 14:15:53 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2203E77ED;
	Fri, 10 Jan 2020 14:15:53 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D539A77E3
 for <cocci@systeme.lip6.fr>; Fri, 10 Jan 2020 14:15:51 +0100 (CET)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00ADFn4F022727
 for <cocci@systeme.lip6.fr>; Fri, 10 Jan 2020 14:15:50 +0100 (CET)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07486; MF=wenyang@linux.alibaba.com;
 NM=1; PH=DS; RN=12; SR=0; TI=SMTPD_---0TnKZRe1_1578662128; 
Received: from localhost(mailfrom:wenyang@linux.alibaba.com
 fp:SMTPD_---0TnKZRe1_1578662128) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 10 Jan 2020 21:15:37 +0800
From: Wen Yang <wenyang@linux.alibaba.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 10 Jan 2020 21:15:26 +0800
Message-Id: <20200110131526.60180-1-wenyang@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 10 Jan 2020 14:15:53 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 10 Jan 2020 14:15:51 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Wen Yang <wenyang@linux.alibaba.com>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH v3] coccinelle: semantic patch to check for
	inappropriate do_div() calls
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

do_div() does a 64-by-32 division.
When the divisor is unsigned long, u64, or s64,
do_div() truncates it to 32 bits, this means it
can test non-zero and be truncated to zero for division.
This semantic patch is inspired by Mateusz Guzik's patch:
commit b0ab99e7736a ("sched: Fix possible divide by zero in avg_atom() calculation")

Signed-off-by: Wen Yang <wenyang@linux.alibaba.com>
Cc: Julia Lawall <julia.lawall@inria.fr>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Matthias Maennich <maennich@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: cocci@systeme.lip6.fr
Cc: linux-kernel@vger.kernel.org
---
v3:
- also filter out safe consts for context mode.
- cleanup code.

v2:
- add a special case for constants and checking whether the value is obviously safe and no warning is needed.
- fix 'WARNING:' twice in each case.
- extend the warning to say "consider using div64_xxx instead".

 scripts/coccinelle/misc/do_div.cocci | 155 +++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 scripts/coccinelle/misc/do_div.cocci

diff --git a/scripts/coccinelle/misc/do_div.cocci b/scripts/coccinelle/misc/do_div.cocci
new file mode 100644
index 000000000000..79db083c5208
--- /dev/null
+++ b/scripts/coccinelle/misc/do_div.cocci
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// do_div() does a 64-by-32 division.
+/// When the divisor is long, unsigned long, u64, or s64,
+/// do_div() truncates it to 32 bits, this means it can test
+/// non-zero and be truncated to 0 for division on 64bit platforms.
+///
+//# This makes an effort to find those inappropriate do_div() calls.
+//
+// Confidence: Moderate
+// Copyright: (C) 2020 Wen Yang, Alibaba.
+// Comments:
+// Options: --no-includes --include-headers
+
+virtual context
+virtual org
+virtual report
+
+@initialize:python@
+@@
+
+def get_digit_type_and_value(str):
+    is_digit = False
+    value = 0
+
+    try:
+        if (str.isdigit()):
+           is_digit = True
+           value =  int(str, 0)
+        elif (str.upper().endswith('ULL')):
+           is_digit = True
+           value = int(str[:-3], 0)
+        elif (str.upper().endswith('LL')):
+           is_digit = True
+           value = int(str[:-2], 0)
+        elif (str.upper().endswith('UL')):
+           is_digit = True
+           value = int(str[:-2], 0)
+        elif (str.upper().endswith('L')):
+           is_digit = True
+           value = int(str[:-1], 0)
+        elif (str.upper().endswith('U')):
+           is_digit = True
+           value = int(str[:-1], 0)
+    except Exception as e:
+          print('Error:',e)
+          is_digit = False
+          value = 0
+    finally:
+        return is_digit, value
+
+def filter_out_safe_constants(str):
+    is_digit, value = get_digit_type_and_value(str)
+    if (is_digit):
+        if (value >= 0x100000000):
+            return True
+        else:
+            return False
+    else:
+        return True
+
+def construct_warnings(suggested_fun):
+    msg="WARNING: do_div() does a 64-by-32 division, please consider using %s instead."
+    return  msg % suggested_fun
+
+@depends on context@
+expression f;
+long l: script:python() { filter_out_safe_constants(l) };
+unsigned long ul : script:python() { filter_out_safe_constants(ul) };
+u64 ul64 : script:python() { filter_out_safe_constants(ul64) };
+s64 sl64 : script:python() { filter_out_safe_constants(sl64) };
+
+@@
+(
+* do_div(f, l);
+|
+* do_div(f, ul);
+|
+* do_div(f, ul64);
+|
+* do_div(f, sl64);
+)
+
+@r depends on (org || report)@
+expression f;
+position p;
+long l: script:python() { filter_out_safe_constants(l) };
+unsigned long ul : script:python() { filter_out_safe_constants(ul) };
+u64 ul64 : script:python() { filter_out_safe_constants(ul64) };
+s64 sl64 : script:python() { filter_out_safe_constants(sl64) };
+@@
+(
+do_div@p(f, l);
+|
+do_div@p(f, ul);
+|
+do_div@p(f, ul64);
+|
+do_div@p(f, sl64);
+)
+
+@script:python depends on org@
+p << r.p;
+ul << r.ul;
+@@
+
+coccilib.org.print_todo(p[0], construct_warnings("div64_ul"))
+
+@script:python depends on org@
+p << r.p;
+l << r.l;
+@@
+
+coccilib.org.print_todo(p[0], construct_warnings("div64_long"))
+
+@script:python depends on org@
+p << r.p;
+ul64 << r.ul64;
+@@
+
+coccilib.org.print_todo(p[0], construct_warnings("div64_u64"))
+
+@script:python depends on org@
+p << r.p;
+sl64 << r.sl64;
+@@
+
+coccilib.org.print_todo(p[0], construct_warnings("div64_s64"))
+
+@script:python depends on report@
+p << r.p;
+ul << r.ul;
+@@
+
+coccilib.report.print_report(p[0], construct_warnings("div64_ul"))
+
+@script:python depends on report@
+p << r.p;
+l << r.l;
+@@
+
+coccilib.report.print_report(p[0], construct_warnings("div64_long"))
+
+@script:python depends on report@
+p << r.p;
+sl64 << r.sl64;
+@@
+
+coccilib.report.print_report(p[0], construct_warnings("div64_s64"))
+
+@script:python depends on report@
+p << r.p;
+ul64 << r.ul64;
+@@
+
+coccilib.report.print_report(p[0], construct_warnings("div64_u64"))
-- 
2.23.0

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

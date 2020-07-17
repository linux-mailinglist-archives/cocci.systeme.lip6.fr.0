Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA922223AEE
	for <lists+cocci@lfdr.de>; Fri, 17 Jul 2020 13:58:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06HBvpVD023904;
	Fri, 17 Jul 2020 13:57:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DDC707815;
	Fri, 17 Jul 2020 13:57:50 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9CC033D0F
 for <cocci@systeme.lip6.fr>; Fri, 17 Jul 2020 13:57:48 +0200 (CEST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06HBvlvC002006
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 17 Jul 2020 13:57:48 +0200 (CEST)
Received: by mail-lj1-f175.google.com with SMTP id h22so12264614lji.9
 for <cocci@systeme.lip6.fr>; Fri, 17 Jul 2020 04:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ubfBDdW2++j5eaV9mb0eIDuZD4NKThyxipf8VY2yx0=;
 b=fNWAVTDFliQpBU3bh1nM/PWjmS+/Bl6TyMoJ7FjBZKWUjdyoxI9c2TmCy2wfVgrwWg
 3Y2mSuyeY2MwKDOhKGNXK+02HjP6OocLvv0kYcsPBTsuiuugkAQVLbu1A439OiEjA17q
 YmGW06YtK2sy3XvMIW41LeepdmvzI6p3vCms1a6ihkI2Txdx1A31773eH9pjT010GKao
 SRjKPlRa1kxdAIS5m27Qfo6ZLyuHDOOhl6QQt8g5aFaz8PR/9GWdGa4leQ9zf48/embh
 pfI1T+q0EJdBXaY4+v+SgZjm1Dt6m3M/tsrvIr4xweSymhPiRHHAByGKO5W4moXR8Kaw
 NAvQ==
X-Gm-Message-State: AOAM533K30brbbvz2c+x1ZvpnJ6W5c9u0XufifJ4AaWTZqZXomtijuLc
 plVjdTvdUD/lQqODzjhgj8k=
X-Google-Smtp-Source: ABdhPJzuI6woF561VO0aSK2Mi9PGCPavc5qDN1Shkuu2ue5V3ygILHDv72Z111OcnNYjIQIU2oShUQ==
X-Received: by 2002:a05:651c:1106:: with SMTP id
 d6mr4220363ljo.214.1594987067436; 
 Fri, 17 Jul 2020 04:57:47 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id f13sm1843100lfs.29.2020.07.17.04.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 04:57:46 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Fri, 17 Jul 2020 14:57:09 +0300
Message-Id: <20200717115709.543882-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604140805.111613-1-efremov@linux.com>
References: <20200604140805.111613-1-efremov@linux.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 17 Jul 2020 13:57:51 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 17 Jul 2020 13:57:48 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: [Cocci] [PATCH v4] coccinelle: api: add kzfree script
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

Check for memset()/memzero_explicit() followed by kfree()/vfree()/kvfree().

Signed-off-by: Denis Efremov <efremov@linux.com>
---
Changes in v2:
 - memset_explicit() added
 - kvfree_sensitive() added
 - forall added to r1
 - ... between memset and kfree added
Changes in v3:
 - Explicit filter for definitions instead of !(file in "...") conditions
 - type T added to match casts
 - memzero_explicit() patterns fixed
 - additional rule "cond" added to filter false-positives
Changes in v4:
 - memset call fixed in rp_memset
 - @m added to rp_memset,rp_memzero rules

 scripts/coccinelle/api/kzfree.cocci | 101 ++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 scripts/coccinelle/api/kzfree.cocci

diff --git a/scripts/coccinelle/api/kzfree.cocci b/scripts/coccinelle/api/kzfree.cocci
new file mode 100644
index 000000000000..33625bd7cec9
--- /dev/null
+++ b/scripts/coccinelle/api/kzfree.cocci
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Use kzfree, kvfree_sensitive rather than memset or
+/// memzero_explicit followed by kfree
+///
+// Confidence: High
+// Copyright: (C) 2020 Denis Efremov ISPRAS
+// Options: --no-includes --include-headers
+//
+// Keywords: kzfree, kvfree_sensitive
+//
+
+virtual context
+virtual patch
+virtual org
+virtual report
+
+@initialize:python@
+@@
+# kmalloc_oob_in_memset uses memset to explicitly trigger out-of-bounds access
+filter = frozenset(['kmalloc_oob_in_memset', 'kzfree', 'kvfree_sensitive'])
+
+def relevant(p):
+    return not (filter & {el.current_element for el in p})
+
+@cond@
+position ok;
+@@
+
+if (...)
+  \(memset@ok\|memzero_explicit@ok\)(...);
+
+@r depends on !patch forall@
+expression E;
+position p : script:python() { relevant(p) };
+position m != cond.ok;
+type T;
+@@
+
+(
+* memset@m((T)E, 0, ...);
+|
+* memzero_explicit@m((T)E, ...);
+)
+  ... when != E
+      when strict
+* \(kfree\|vfree\|kvfree\)(E)@p;
+
+@rp_memzero depends on patch@
+expression E, size;
+position p : script:python() { relevant(p) };
+position m != cond.ok;
+type T;
+@@
+
+- memzero_explicit@m((T)E, size);
+  ... when != E
+      when strict
+// TODO: uncomment when kfree_sensitive will be merged.
+// Only this case is commented out because developers
+// may not like patches like this since kzfree uses memset
+// internally (not memzero_explicit).
+//(
+//- kfree(E)@p;
+//+ kfree_sensitive(E);
+//|
+- \(vfree\|kvfree\)(E)@p;
++ kvfree_sensitive(E, size);
+//)
+
+@rp_memset depends on patch@
+expression E, size;
+position p : script:python() { relevant(p) };
+position m != cond.ok;
+type T;
+@@
+
+- memset@m((T)E, 0, size);
+  ... when != E
+      when strict
+(
+- kfree(E)@p;
++ kzfree(E);
+|
+- \(vfree\|kvfree\)(E)@p;
++ kvfree_sensitive(E, size);
+)
+
+@script:python depends on report@
+p << r.p;
+@@
+
+coccilib.report.print_report(p[0],
+  "WARNING: opportunity for kzfree/kvfree_sensitive")
+
+@script:python depends on org@
+p << r.p;
+@@
+
+coccilib.org.print_todo(p[0],
+  "WARNING: opportunity for kzfree/kvfree_sensitive")
-- 
2.26.2

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

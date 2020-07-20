Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD1E22687F
	for <lists+cocci@lfdr.de>; Mon, 20 Jul 2020 18:23:24 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06KGN5lY001884;
	Mon, 20 Jul 2020 18:23:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9399C7814;
	Mon, 20 Jul 2020 18:23:05 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D334544A7
 for <cocci@systeme.lip6.fr>; Mon, 20 Jul 2020 18:23:03 +0200 (CEST)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06KGN3Lj021926
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 20 Jul 2020 18:23:03 +0200 (CEST)
Received: by mail-lf1-f66.google.com with SMTP id i80so10030646lfi.13
 for <cocci@systeme.lip6.fr>; Mon, 20 Jul 2020 09:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+lKzMgNHSZBwMM73IvRnAjP9uhf7arni1ElfIUbtptY=;
 b=GwkvTaS1/5UKUOyoPL0opRHLRNS7785wGwxNllc+RujROUBrzynENDhK8eh+EmoV9P
 +mxrUmDEw//XIqTOwi7rWmVcONB6czxVn79N2nYOKhmJ0YnQHOeR6s7Wcqq0y+jNupxF
 5CRZ0rZU5fwLb1GJWUZ3+mpu/f81tisNIK1nXD6FHlTXhItdo02Q8CLO81aWaAktfklu
 ZGx/BnBB/y87+CExs12DuMmYF8RPBbDDGNdJRuyMavWS+hy4k3kGL0qJleMCUgzutsbv
 o4Hk2dA7LbtqZlPMh/knw8jWLV8ph/eZHO0QsRGxJNt9DoPkxqTyJY6CqJxCDJ98N3cK
 Ck6A==
X-Gm-Message-State: AOAM5332n5sAav7ag64mMPnSrSUvjhYcbpcrF337sID8x9lshsdf70mk
 NHKDT2Qt+aWHDIWXY6Vb3Mc=
X-Google-Smtp-Source: ABdhPJzjRxThU/ubx1ubrqCrZKttqYgYO0o/ua6iV1P8zBoIJT5x5Ap/Vv4slkqGwX81dZZvnnRAVg==
X-Received: by 2002:a19:414b:: with SMTP id o72mr10899004lfa.86.1595262182808; 
 Mon, 20 Jul 2020 09:23:02 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id a19sm925855lff.25.2020.07.20.09.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 09:23:02 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 20 Jul 2020 19:22:15 +0300
Message-Id: <20200720162216.13248-3-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200720162216.13248-1-efremov@linux.com>
References: <20200720162216.13248-1-efremov@linux.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 20 Jul 2020 18:23:05 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 20 Jul 2020 18:23:03 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: [Cocci] [PATCH v3 2/3] coccinelle: api: extend memdup_user rule
	with vmemdup_user()
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

Add vmemdup_user() transformations to the memdup_user.cocci rule.
Commit 50fd2f298bef ("new primitive: vmemdup_user()") introduced
vmemdup_user(). The function uses kvmalloc with GPF_USER flag.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 scripts/coccinelle/api/memdup_user.cocci | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/scripts/coccinelle/api/memdup_user.cocci b/scripts/coccinelle/api/memdup_user.cocci
index 0e29d41ecab8..60027e21c5e6 100644
--- a/scripts/coccinelle/api/memdup_user.cocci
+++ b/scripts/coccinelle/api/memdup_user.cocci
@@ -39,6 +39,28 @@ identifier l1,l2;
 -    ...+>
 -  }
 
+@depends on patch@
+expression from,to,size;
+identifier l1,l2;
+@@
+
+-  to = \(kvmalloc\|kvzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
++  to = vmemdup_user(from,size);
+   if (
+-      to==NULL
++      IS_ERR(to)
+                 || ...) {
+   <+... when != goto l1;
+-  -ENOMEM
++  PTR_ERR(to)
+   ...+>
+   }
+-  if (copy_from_user(to, from, size) != 0) {
+-    <+... when != goto l2;
+-    -EFAULT
+-    ...+>
+-  }
+
 @r depends on !patch@
 expression from,to,size;
 position p;
@@ -52,6 +74,17 @@ statement S1,S2;
    if (copy_from_user(to, from, size) != 0)
    S2
 
+@rv depends on !patch@
+expression from,to,size;
+position p;
+statement S1,S2;
+@@
+
+*  to = \(kvmalloc@p\|kvzalloc@p\)(size,\(GFP_KERNEL\|GFP_USER\));
+   if (to==NULL || ...) S1
+   if (copy_from_user(to, from, size) != 0)
+   S2
+
 @script:python depends on org@
 p << r.p;
 @@
@@ -63,3 +96,15 @@ p << r.p;
 @@
 
 coccilib.report.print_report(p[0], "WARNING opportunity for memdup_user")
+
+@script:python depends on org@
+p << rv.p;
+@@
+
+coccilib.org.print_todo(p[0], "WARNING opportunity for vmemdup_user")
+
+@script:python depends on report@
+p << rv.p;
+@@
+
+coccilib.report.print_report(p[0], "WARNING opportunity for vmemdup_user")
-- 
2.26.2

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

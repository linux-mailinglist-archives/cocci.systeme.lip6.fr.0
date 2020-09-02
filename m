Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A425AEA3
	for <lists+cocci@lfdr.de>; Wed,  2 Sep 2020 17:19:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 082FJAvx018942;
	Wed, 2 Sep 2020 17:19:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id F259077BC;
	Wed,  2 Sep 2020 17:19:09 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A25FD3F6C
 for <cocci@systeme.lip6.fr>; Wed,  2 Sep 2020 17:19:08 +0200 (CEST)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 082FJ7Hi009945
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 2 Sep 2020 17:19:08 +0200 (CEST)
Received: by mail-lj1-f196.google.com with SMTP id t23so6401583ljc.3
 for <cocci@systeme.lip6.fr>; Wed, 02 Sep 2020 08:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HsbOuaSUjgAzeexavqDg8BNI1kBauuGj+WofnxN6QNY=;
 b=AlwkaIuN5Bmf5qiOgXODECPMALDnKXlvdLSj752OYX/0pYBJ3BQjGjH3wYolD2WNoS
 uklGxJCuPo3rho4qZCU1+wvP9/O+ae7e5Vv6Vg36vykSSQKALggZnYKmpXMFVtCqhNVX
 sIH9q8nmgySzg1itvZk9HF1hBcfcs9V4X9ft1R3ZuD+nVPZLd7cPJ01sg68YXKONErVI
 ftL9AJ9OgRd1bYqGCF8W3MdNh8wdJ1in0kMqEYBZH04ZCnEMApcqDAZIV9PEfbNw4J3s
 7bsK99ceYtOiImZ0qtdybDvTVOAovzwOTCHPMi95BtchOdof0UcqLwTZrDDFBulidmtT
 yJrQ==
X-Gm-Message-State: AOAM531+nnCTV30ElZbuRC6HGUEcCANMxnM+MdCsCU7WcaqcOIlHJzMU
 7Md5gd9FAMPcWicVqp4NURRziMkJztA=
X-Google-Smtp-Source: ABdhPJzACUXTQXy8Xb64npDMdaJF3tKdaUBc6OWlHTbLKCrBuYLg4OLJRN9ayI7m+UELp0ovEVY3+w==
X-Received: by 2002:a05:651c:310:: with SMTP id
 a16mr3378753ljp.250.1599059947599; 
 Wed, 02 Sep 2020 08:19:07 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id n8sm1036690ljj.69.2020.09.02.08.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 08:19:06 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Wed,  2 Sep 2020 18:18:59 +0300
Message-Id: <20200902151859.403354-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 02 Sep 2020 17:19:10 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 02 Sep 2020 17:19:08 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: [Cocci] [PATCH] coccinelle: misc: add excluded_middle.cocci script
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

Check for "!A || A && B" condition. It's equivalent to
"!A || B" condition.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 scripts/coccinelle/misc/excluded_middle.cocci | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 scripts/coccinelle/misc/excluded_middle.cocci

diff --git a/scripts/coccinelle/misc/excluded_middle.cocci b/scripts/coccinelle/misc/excluded_middle.cocci
new file mode 100644
index 000000000000..1b8c20f13966
--- /dev/null
+++ b/scripts/coccinelle/misc/excluded_middle.cocci
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Condition "!A || A && B" is equalent to "!A || B".
+///
+// Confidence: High
+// Copyright: (C) 2020 Denis Efremov ISPRAS
+// Options: --no-includes --include-headers
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@r depends on !patch@
+expression A, B;
+position p;
+@@
+
+* !A || (A && B)@p
+
+@depends on patch@
+expression A, B;
+@@
+
+  !A || 
+-      (A &&
+             B
+-      )
+
+@script:python depends on report@
+p << r.p;
+@@
+
+coccilib.report.print_report(p[0], "WARNING condition !A || A && B is equivalent to !A || B")
+
+@script:python depends on org@
+p << r.p;
+@@
+
+coccilib.org.print_todo(p[0], "WARNING condition !A || A && B is equivalent to !A || B")
-- 
2.26.2

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B911524E1E5
	for <lists+cocci@lfdr.de>; Fri, 21 Aug 2020 22:12:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07LKC7l2011662;
	Fri, 21 Aug 2020 22:12:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4242A77BC;
	Fri, 21 Aug 2020 22:12:07 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2A9584173
 for <cocci@systeme.lip6.fr>; Fri, 21 Aug 2020 22:12:05 +0200 (CEST)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07LKC20T005312
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 21 Aug 2020 22:12:03 +0200 (CEST)
Received: by mail-lj1-f196.google.com with SMTP id w14so3193031ljj.4
 for <cocci@systeme.lip6.fr>; Fri, 21 Aug 2020 13:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LyeWE+LKBU/Cc6jZ0EOliLucORAUIo1fVngoaszDbjk=;
 b=iKMMXB7ZvCRuojreD5lurnEr5EGahnc+jX9Dq1aj1/LH/klkzbUETucB0fgrGFAaEw
 X1WHik5j5MX/Me8CFalUFtg7rFxMh1MkXD7m0LlCcdjlKyCeyaFreo4xP9d6U3HiKV5g
 g10Nw7CzfHLIDVOG4aAHO5RYmHTOgwilbGIXhabRrc8gH9AO7YQDmKQUNKm1c/Sazqbx
 5SOgyyNWThIEolFVq6IRNytdINF788YgvoAh7Edde07AHsYj1zHm90rgvyy2GA7+HP0L
 LcR8pOIk1sNhlWNXMN1tUVZ2c5NfsiDdGhASq+JKt9XXNNS6dXlJo0HfuoRsL4ZPXeh6
 74zw==
X-Gm-Message-State: AOAM533gDRIYuCe4oJ9+gqpAPUtqZEc3RpPb5jqMeEWSjh8jCv2tgnPH
 iQUEgai+LbpdPSGp8wi+J4o=
X-Google-Smtp-Source: ABdhPJyhagp9to2mtAwdA6ErEpfc8xGN5letkxAA0MMYvoQImxKRAqu0ePqH9Pqx/HdmxRb1JIU5AA==
X-Received: by 2002:a2e:b0db:: with SMTP id g27mr2422415ljl.69.1598040722687; 
 Fri, 21 Aug 2020 13:12:02 -0700 (PDT)
Received: from localhost.localdomain ([213.87.151.123])
 by smtp.googlemail.com with ESMTPSA id v1sm572695ljg.60.2020.08.21.13.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 13:12:01 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 21 Aug 2020 23:11:37 +0300
Message-Id: <20200821201137.446423-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821153100.434332-1-efremov@linux.com>
References: <20200821153100.434332-1-efremov@linux.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 21 Aug 2020 22:12:08 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 21 Aug 2020 22:12:03 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: [Cocci] [PATCH v2] coccinelle: api: add kobj_to_dev.cocci script
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

Use kobj_to_dev() instead of container_of().

Signed-off-by: Denis Efremov <efremov@linux.com>
---
Changes in v2:
 - "symbol kobj;" added to the rule r

 scripts/coccinelle/api/kobj_to_dev.cocci | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 scripts/coccinelle/api/kobj_to_dev.cocci

diff --git a/scripts/coccinelle/api/kobj_to_dev.cocci b/scripts/coccinelle/api/kobj_to_dev.cocci
new file mode 100644
index 000000000000..cd5d31c6fe76
--- /dev/null
+++ b/scripts/coccinelle/api/kobj_to_dev.cocci
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Use kobj_to_dev() instead of container_of()
+///
+// Confidence: High
+// Copyright: (C) 2020 Denis Efremov ISPRAS
+// Options: --no-includes --include-headers
+//
+// Keywords: kobj_to_dev, container_of
+//
+
+virtual context
+virtual report
+virtual org
+virtual patch
+
+
+@r depends on !patch@
+expression ptr;
+symbol kobj;
+position p;
+@@
+
+* container_of(ptr, struct device, kobj)@p
+
+
+@depends on patch@
+expression ptr;
+@@
+
+- container_of(ptr, struct device, kobj)
++ kobj_to_dev(ptr)
+
+
+@script:python depends on report@
+p << r.p;
+@@
+
+coccilib.report.print_report(p[0], "WARNING opportunity for kobj_to_dev()")
+
+@script:python depends on org@
+p << r.p;
+@@
+
+coccilib.org.print_todo(p[0], "WARNING opportunity for kobj_to_dev()")
-- 
2.26.2

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

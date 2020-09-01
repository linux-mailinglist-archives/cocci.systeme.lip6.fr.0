Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E8B258B89
	for <lists+cocci@lfdr.de>; Tue,  1 Sep 2020 11:28:37 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0819RpvX028500;
	Tue, 1 Sep 2020 11:27:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 34D0977BC;
	Tue,  1 Sep 2020 11:27:51 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4340C4385
 for <cocci@systeme.lip6.fr>; Tue,  1 Sep 2020 11:27:49 +0200 (CEST)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 0819RjYx028510
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 1 Sep 2020 11:27:46 +0200 (CEST)
Received: by mail-lj1-f193.google.com with SMTP id s205so657360lja.7
 for <cocci@systeme.lip6.fr>; Tue, 01 Sep 2020 02:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bxHj9IkP2gtxX/i6bFF2tG+AqOJbAH96n0YTP0cULME=;
 b=k+9wdGOQhb2YewG0rhz4F3W6m6e430AebWWXbMqan22ObQ/irWEWqMuU6nA8Rq2eRU
 zK6I5Cxf4WZPsu0/hK6UdI2jNFoPgatd038lcmOZI2pFubShNEh5sDfbmNNjBcQp5t4a
 OgleL9A3CjBXWTRx8bRW+cyXgK0vyI3gx8pO8WTd6g2jeiTCPj59rWRVGNFGq9UNz0u9
 nblvaW6wz7DVTmlBf1A58CDMsKavOY/cyEO51pNLZb2uVUDJFVVkfLmhxUam5UhT7y9e
 2y102lp2KuSV16sx72T/tG8MX80v6KQeeW3pp2Bvwe9MWr+7Vn9lss7CzxkPs/rmeuO+
 NSnQ==
X-Gm-Message-State: AOAM531jVYrbr+mlr0abSHOQFvY8g9u3WPXkxZxEaEsDjmiEk2Y1rMPn
 TfVTAlIzCU6Sy2rfWNAfT7PqqdY05/E=
X-Google-Smtp-Source: ABdhPJx0qGwCOTQ7CSAhelVaFobcO3DyBY2PqNQwxS+oFESnC0sGXMHSiHAzBtv++XLExhGWdojKEA==
X-Received: by 2002:a2e:96cb:: with SMTP id d11mr98310ljj.239.1598952465687;
 Tue, 01 Sep 2020 02:27:45 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id t4sm152816ljh.122.2020.09.01.02.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 02:27:44 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue,  1 Sep 2020 12:27:29 +0300
Message-Id: <20200901092729.427515-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 01 Sep 2020 11:27:51 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 01 Sep 2020 11:27:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: [Cocci] [PATCH] coccinelle: api: kobj_to_dev: don't warn about
	kobj_to_dev()
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

Exclude kobj_to_dev() definition from warnings.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
No changes in performance. This patch can be squashed to the
original patch with kobj_to_dev.cocci script.

 scripts/coccinelle/api/kobj_to_dev.cocci | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/coccinelle/api/kobj_to_dev.cocci b/scripts/coccinelle/api/kobj_to_dev.cocci
index cd5d31c6fe76..d0b3b9647c19 100644
--- a/scripts/coccinelle/api/kobj_to_dev.cocci
+++ b/scripts/coccinelle/api/kobj_to_dev.cocci
@@ -15,10 +15,18 @@ virtual org
 virtual patch
 
 
+@initialize:python@
+@@
+filter = frozenset(['kobj_to_dev'])
+
+def relevant(p):
+    return not (filter & {el.current_element for el in p})
+
+
 @r depends on !patch@
 expression ptr;
 symbol kobj;
-position p;
+position p : script:python() { relevant(p) };
 @@
 
 * container_of(ptr, struct device, kobj)@p
@@ -26,9 +34,10 @@ position p;
 
 @depends on patch@
 expression ptr;
+position p : script:python() { relevant(p) };
 @@
 
-- container_of(ptr, struct device, kobj)
+- container_of(ptr, struct device, kobj)@p
 + kobj_to_dev(ptr)
 
 
-- 
2.26.2

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

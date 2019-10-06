Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436ACCEB1
	for <lists+cocci@lfdr.de>; Sun,  6 Oct 2019 07:29:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x965T5vK003894;
	Sun, 6 Oct 2019 07:29:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BA6AB77BD;
	Sun,  6 Oct 2019 07:29:04 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AE0107792
 for <cocci@systeme.lip6.fr>; Sun,  6 Oct 2019 06:45:46 +0200 (CEST)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x964jjXf017195
 for <cocci@systeme.lip6.fr>; Sun, 6 Oct 2019 06:45:46 +0200 (CEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 21C9011A9C1C129B634B;
 Sun,  6 Oct 2019 12:45:45 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Sun, 6 Oct 2019
 12:45:35 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <Julia.Lawall@lip6.fr>, <Gilles.Muller@lip6.fr>, <nicolas.palix@imag.fr>,
        <michal.lkml@markovi.net>, <maennich@google.com>,
        <yuehaibing@huawei.com>, <jeyu@kernel.org>,
        <gregkh@linuxfoundation.org>, <yamada.masahiro@socionext.com>,
        <Markus.Elfring@web.de>
Date: Sun, 6 Oct 2019 12:44:56 +0800
Message-ID: <20191006044456.57608-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <CAK7LNAS2K6i+s2A_xTyRq730M6_=tyjtfwHAnEHF37_nrJa4Eg@mail.gmail.com>
References: <CAK7LNAS2K6i+s2A_xTyRq730M6_=tyjtfwHAnEHF37_nrJa4Eg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 06 Oct 2019 07:29:05 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 06 Oct 2019 06:45:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Sun, 06 Oct 2019 07:29:02 +0200
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: [Cocci] [PATCH] scripts: add_namespace: Fix coccicheck failed
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

Now all scripts in scripts/coccinelle to be automatically called
by coccicheck. However new adding add_namespace.cocci does not
support report mode, which make coccicheck failed.
This add "virtual report" to  make the coccicheck go ahead smoothly.

Fixes: eb8305aecb95 ("scripts: Coccinelle script for namespace dependencies.")
Acked-by: Julia Lawall <julia.lawall@lip6.fr>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 scripts/coccinelle/misc/add_namespace.cocci | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/coccinelle/misc/add_namespace.cocci b/scripts/coccinelle/misc/add_namespace.cocci
index c832bb6445a8..99e93a6c2e24 100644
--- a/scripts/coccinelle/misc/add_namespace.cocci
+++ b/scripts/coccinelle/misc/add_namespace.cocci
@@ -6,6 +6,8 @@
 /// add a missing namespace tag to a module source file.
 ///
 
+virtual report
+
 @has_ns_import@
 declarer name MODULE_IMPORT_NS;
 identifier virtual.ns;
-- 
2.20.1


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

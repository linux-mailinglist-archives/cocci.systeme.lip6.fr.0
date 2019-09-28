Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED5FC10C8
	for <lists+cocci@lfdr.de>; Sat, 28 Sep 2019 14:14:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8SCDVbg029120;
	Sat, 28 Sep 2019 14:13:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B924F77B8;
	Sat, 28 Sep 2019 14:13:31 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8E76077A2
 for <cocci@systeme.lip6.fr>; Sat, 28 Sep 2019 11:43:08 +0200 (CEST)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8S9h5tV017297
 for <cocci@systeme.lip6.fr>; Sat, 28 Sep 2019 11:43:06 +0200 (CEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EDA6B7E2BF0D9B13C98D;
 Sat, 28 Sep 2019 17:43:00 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Sat, 28 Sep 2019
 17:42:50 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <Julia.Lawall@lip6.fr>, <Gilles.Muller@lip6.fr>, <nicolas.palix@imag.fr>,
        <michal.lkml@markovi.net>, <maennich@google.com>,
        <gregkh@linuxfoundation.org>
Date: Sat, 28 Sep 2019 17:42:45 +0800
Message-ID: <20190928094245.45696-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 28 Sep 2019 14:13:35 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 28 Sep 2019 11:43:06 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Sat, 28 Sep 2019 14:13:29 +0200
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: [Cocci] [RFC PATCH] scripts: Fix coccicheck failed
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

Run make coccicheck, I got this:

spatch -D patch --no-show-diff --very-quiet --cocci-file
 ./scripts/coccinelle/misc/add_namespace.cocci --dir .
 -I ./arch/x86/include -I ./arch/x86/include/generated
 -I ./include -I ./arch/x86/include/uapi
 -I ./arch/x86/include/generated/uapi -I ./include/uapi
 -I ./include/generated/uapi --include ./include/linux/kconfig.h
 --jobs 192 --chunksize 1

virtual rule patch not supported
coccicheck failed

It seems add_namespace.cocci cannot be called in coccicheck.

Fixes: eb8305aecb95 ("scripts: Coccinelle script for namespace dependencies.")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 scripts/{coccinelle/misc => }/add_namespace.cocci | 0
 scripts/nsdeps                                    | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename scripts/{coccinelle/misc => }/add_namespace.cocci (100%)

diff --git a/scripts/coccinelle/misc/add_namespace.cocci b/scripts/add_namespace.cocci
similarity index 100%
rename from scripts/coccinelle/misc/add_namespace.cocci
rename to scripts/add_namespace.cocci
diff --git a/scripts/nsdeps b/scripts/nsdeps
index ac2b6031dd13..0f743b76e501 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -23,7 +23,7 @@ fi
 
 generate_deps_for_ns() {
 	$SPATCH --very-quiet --in-place --sp-file \
-		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D ns=$1 $2
+		$srctree/scripts/add_namespace.cocci -D ns=$1 $2
 }
 
 generate_deps() {
-- 
2.20.1


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

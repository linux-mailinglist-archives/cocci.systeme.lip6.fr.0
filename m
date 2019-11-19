Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C9E102E6A
	for <lists+cocci@lfdr.de>; Tue, 19 Nov 2019 22:44:22 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJLi87I029838;
	Tue, 19 Nov 2019 22:44:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0A91577D8;
	Tue, 19 Nov 2019 22:44:09 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E9D6277D8
 for <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 22:44:06 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJLi4uM015686
 for <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 22:44:06 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,219,1571695200"; d="scan'208";a="412575411"
Received: from palace.lip6.fr ([132.227.105.202])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 19 Nov 2019 22:44:04 +0100
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Nov 2019 22:08:22 +0100
Message-Id: <1574197705-31132-2-git-send-email-Julia.Lawall@lip6.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574197705-31132-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1574197705-31132-1-git-send-email-Julia.Lawall@lip6.fr>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 19 Nov 2019 22:44:09 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 19 Nov 2019 22:44:06 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Gilles Muller <Gilles.Muller@inria.fr>, cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH 1/4 v2] coccinelle: platform_get_irq: simplify
	context case
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

Simplify to just report on the first dev_err, whereever it occurs.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: no change

 scripts/coccinelle/api/platform_get_irq.cocci |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/scripts/coccinelle/api/platform_get_irq.cocci b/scripts/coccinelle/api/platform_get_irq.cocci
index 06b6a95..c6ac755 100644
--- a/scripts/coccinelle/api/platform_get_irq.cocci
+++ b/scripts/coccinelle/api/platform_get_irq.cocci
@@ -23,16 +23,9 @@ platform_get_irq_byname
 
 if ( \( ret < 0 \| ret <= 0 \) )
 {
-(
-if (ret != -EPROBE_DEFER)
-{ ...
-*dev_err(...);
-... }
-|
 ...
 *dev_err(...);
-)
-...
+... when any
 }
 
 @depends on patch@

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

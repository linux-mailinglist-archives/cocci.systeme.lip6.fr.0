Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF125F9FD
	for <lists+cocci@lfdr.de>; Mon,  7 Sep 2020 13:57:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 087BuagV007971;
	Mon, 7 Sep 2020 13:56:37 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BFA4A77BF;
	Mon,  7 Sep 2020 13:56:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3BC014316
 for <cocci@systeme.lip6.fr>; Mon,  7 Sep 2020 13:43:58 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 087BhvLx025687;
 Mon, 7 Sep 2020 13:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1599479036;
 bh=JPRyV+Qc+egVKfogM7Y19XI7mROVbjj8KK9JyF9BQoE=;
 h=X-UI-Sender-Class:Subject:From:To:References:Cc:Date:In-Reply-To;
 b=kBw9kCDCk4pHbTF9voIsbfLXD54p7STKU29j3VniMDiK4yWhP6KzHv65OQFi34gUN
 nBzZX1plfCbjdEsRpEa9b+cNf/OD7chuHF6IvTgIYzuTIpu/8go24bMHr8JSyp2rAz
 /KosEys7iLGxtSBlH+f2r9Tjy0sknZT6KWOOr4pw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.162.183]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MdfCN-1korQj0pZx-00ZU8e; Mon, 07
 Sep 2020 13:43:56 +0200
From: Markus Elfring <Markus.Elfring@web.de>
To: Coccinelle <cocci@systeme.lip6.fr>, Dejin Zheng <zhengdejin5@gmail.com>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix
 <nicolas.palix@imag.fr>,
        kernel-janitors@vger.kernel.org
References: <25b804fd-0d04-475d-f614-26c03c9fd544@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5f9fdd59-4b0b-1cb5-c3a2-92efc5bb3841@web.de>
Date: Mon, 7 Sep 2020 13:43:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <25b804fd-0d04-475d-f614-26c03c9fd544@web.de>
Content-Language: en-GB
X-Provags-ID: V03:K1:+BZaOXdqdJiBw2DjeGJ9A4X5U/dGHKZ/rMPCzrctd8F9rkswbvN
 /ZlBji3jRKbWOjTpDOKIxh7DYOfAwCCx0p2p9f8zAFBo0Qlxvu1jVl5HHgAwtI9tWRQRYya
 x9pETF4U+KNsR9nvc3hyUTrov68bt6NjdCLzR45PXxUePDRoeUHbFEpneZPHr6Gt98mBOJ4
 QCMxdi97ubommR7EekLAg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BhiYDpBx300=:x6nhbQnCUkdXLJT70gG+tT
 9zPc9ghBXN2pT2t3qf/XHmYJFnZQLfyYUO6lXEgoZa5KqpbQAXdeflRK6Utb2QbYC4dPQgFUm
 yiqJ6gdxnAmGPPjruAcViRFSgsgZshCuh87X6ePi690QeEMR6dCps96jPW67IwmbBWcniEQ29
 pxwfPZKANevvE76if3qKIUFChTcJ84mCKJnVKlknZ8svc+faYQnqgSSkZZPZY6jL2w/XIjKK9
 we9oxlmaKcuM8lV/Sws5HYlMvgSACmOm073nDuoyoxJcHHsRcmmVMGiySUnR+yJU0Ip09gO7z
 WenZSm9VED3DWcrH0oVZnMxb3+q30NzqOq8imXuLd1zfn0PWTDwT58r5of93Tx2vE/9cK8cJX
 eDAQAr6ZG8BRQFnZNlrQEDH7c1RIt7qIfw/uCrdnU3huDXkFYxoJpNV+/1cswzHnZRb5iRZ2w
 /GX+wVxFtKMfrs0VfNSEcNdcIX3Pzru+igxbadkYERCskixpAjd6B+4IPPn7WsPOmdI8rsAiW
 h5Ca60GI+dNh33Ug4Hzsq2POi7eHft/UC2lDbqOgozIpKnl9EowSogzHSUZem8hhqmAEsdAXq
 q//kA+6OJLp8Y9FPvXN7r2KNibB54RkyoIyZWfqxdHJHSH+iDG24lFA2VWeeXp2jOXe7S0mLF
 lsZx6nl8t4NMFxr7IGWldUfvdXvBdXSReidpSQZ6+WCn24mgqpd8SEllWUc586TIsLpefEZbp
 6IJhubv+tCh5LHXGNQVOZeo4zx8Teo4pXUKn5ArNtavWBH8V7AlOftS0akMp0HTmcZ+e7wCJw
 BMUxiLtBFxltIT06SRvkHiGk6lfNgx5YTLjfXoqBsfxln+HQJwRjes1dOcUo4zSgVLQ9i6eTe
 uwUixbwxx0MSyXfEx1OTjYVqB0LxrPqLTb8mivJ/i14DnR/sM6IQ/vFlqhA3KI//HxcdvUEhi
 oWlhincwgOZONL26dGRi/g9jUvkmg29raMOo7U2okpYdNejWc9Ym9MK5OhRAun5O2RBIyia1x
 g49ccoxctw2leLs3RarL4xZIArgs0yRYPxNlOVPjpypufLuA8btkL+7jpx7lENYyKwhI8qOQK
 0anbOIwXsTTq5JTVZO9bpDMWIC1GRDM0Mg7aLL7t6Jax0gKbEzHt7SPKofsmQmfRJT2ZPbvcW
 AP0cV4jBlFoZ4JZF6ZEVKF/4P8hH4SrmMtLAbi8OwlMfb2oKIizZ1f1gWscMfrbTQrxezvShi
 GfNo1riLbux5aTN7yMoEDREWn+lpjjyVYhMuZmA==
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 07 Sep 2020 13:56:38 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 07 Sep 2020 13:43:57 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Mon, 07 Sep 2020 13:56:34 +0200
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [Cocci] =?utf-8?q?=5BPATCH=5D_Coccinelle=3A_api=3A_Add_SmPL_scrip?=
 =?utf-8?b?dCDigJx1c2VfZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBfcmVzb3Vy?=
 =?utf-8?b?Y2UuY29jY2nigJ0=?=
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Sep 2020 13:14:44 +0200

Another wrapper function is available since the commit 890cc39a879906b63912482dfc41944579df2dc6
("drivers: provide devm_platform_get_and_ioremap_resource()").
Provide design options for the adjustment of affected source code
by the means of the semantic patch language (Coccinelle software).

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 ...vm_platform_get_and_ioremap_resource.cocci | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 scripts/coccinelle/api/use_devm_platform_get_and_ioremap_resource.cocci

diff --git a/scripts/coccinelle/api/use_devm_platform_get_and_ioremap_resource.cocci b/scripts/coccinelle/api/use_devm_platform_get_and_ioremap_resource.cocci
new file mode 100644
index 000000000000..8e67359f6b76
--- /dev/null
+++ b/scripts/coccinelle/api/use_devm_platform_get_and_ioremap_resource.cocci
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/// Simplify a function call combination by using a known wrapper function.
+//
+// Keywords: wrapper function conversion ioremap resources
+// Confidence: High
+
+virtual context, patch, report, org
+
+@display depends on context@
+expression base, device1, device2, index, private, resource;
+@@
+(
+*resource = platform_get_resource(device1, IORESOURCE_MEM, index);
+ base =
+*       devm_ioremap_resource
+                             (&device1->dev, resource);
+|
+*private->res = platform_get_resource(device1, IORESOURCE_MEM, index);
+ base =
+*       devm_ioremap_resource
+                             (device2, private->res);
+)
+
+@replacement depends on patch@
+expression base, device1, device2, index, private, resource;
+@@
+(
+-resource = platform_get_resource(device1, IORESOURCE_MEM, index);
+ base =
+-       devm_ioremap_resource
++       devm_platform_get_and_ioremap_resource
+                             (
+-                             &
+                               device1
+-                                     ->dev
+                              ,
+-                             resource
++                             index, &resource
+                             );
+|
+-private->res = platform_get_resource(device1, IORESOURCE_MEM, index);
+ base =
+-       devm_ioremap_resource
++       devm_platform_get_and_ioremap_resource
+                             (device2,
+-                             private->res
++                             index, &private->res
+                             );
+)
+
+@or depends on org || report@
+expression base, device1, device2, index, private, resource;
+position p;
+@@
+(
+ resource = platform_get_resource(device1, IORESOURCE_MEM, index);
+ base = devm_ioremap_resource@p(&device1->dev, resource);
+|
+ private->res = platform_get_resource(device1, IORESOURCE_MEM, index);
+ base = devm_ioremap_resource@p(device2, private->res);
+)
+
+@script:python to_do depends on org@
+p << or.p;
+@@
+coccilib.org.print_todo(p[0], "WARNING: opportunity for devm_platform_get_and_ioremap_resource()")
+
+@script:python reporting depends on report@
+p << or.p;
+@@
+coccilib.report.print_report(p[0], "WARNING: opportunity for devm_platform_get_and_ioremap_resource()")
--
2.28.0

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

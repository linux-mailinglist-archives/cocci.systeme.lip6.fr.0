Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7B19DCE5
	for <lists+cocci@lfdr.de>; Fri,  3 Apr 2020 19:38:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 033HbQq1005356;
	Fri, 3 Apr 2020 19:37:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D93C5782F;
	Fri,  3 Apr 2020 19:37:26 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 802477814
 for <cocci@systeme.lip6.fr>; Fri,  3 Apr 2020 19:30:43 +0200 (CEST)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 033HUfYB028835
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 3 Apr 2020 19:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1585935032;
 bh=gNFpDKKwiTezkt3owt2u3asT3zDsRHR/nSLRzKGjZlU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=SarIPIQSqNqxpAt89OURT8FivW6drYCgEVFTsN9/9n9Xuz69uaFls4c0KT/eDp8KZ
 lU+8G/ik3PkJZb5CgwuOQij3cQpU8pwTaWsduldtc/t5PZW2lGaAHFobaYAyhu06Oi
 n9aczJ6O2xJVrSCRkWVwLuXbHtjhwliREHKwDWZw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([82.19.195.159]) by mail.gmx.com
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MhlKy-1ipk5o1hzc-00dp3s; Fri, 03 Apr 2020 19:30:32 +0200
From: Alex Dewar <alex.dewar@gmx.co.uk>
To: alex.dewar@gmx.co.uk
Date: Fri,  3 Apr 2020 18:30:10 +0100
Message-Id: <20200403173011.65511-1-alex.dewar@gmx.co.uk>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:jzuIV293In4jZGU3O+2pdnE+8RxxVxRqA655L/kzkJWgyppp7L3
 /4kLXfJn+ctPh6ZS8Bfwb7/FJEq4aWCM/JIZWI2VTUefC5tTGWTNCetLn2c223EYHsx8Ruv
 j4g8jPlKaLXxDGLoAsET2lDKieDDLvyUlTnLJ0PdtC5OAhBJspekcfQ/Isn/qXCui6hgUyB
 1N0S+6e0wWkzeH1W6fX4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P6FN45gUO5g=:3+cZirxTizNsPm56Jld8M8
 wtcIvejBdbdoPOJ0qcYuRoQA9c+xfailewR63A/FEr8eRT0iU+vE/MYE/XVNSPWjwOTMD7TG1
 ZxvlxxeRuIdfe0ZFpEZgfG5Jmv+n5FB2Zz+C2vXSDzETxttgOIqPQF6h82Vrhx0K4I1t7m5v3
 qv86AyFoeLBKjBKZaTNQtHGSY3XLZFbJuqKHTtEMXkmcDmW/fT+XwTwq+AeuoIGW0z6rgOTop
 MCNSftpZ4AceAhfLasTxlPDJle0Hpau5KaOYXPpvOW0NK6moTEeWvKVh4DJ3G7nt6IghgtYNB
 PYyuomgJE9FDHnBmjGFYRWYER7QVdwhphAq0AcsAWKbtkEc+yGUOa/Mc6MD7Vhc5hMh8C7lSj
 jQQBTvAIxGwGKQEqNAUpy+n3zZGcQrq2wWWLCSb3Up73P7sNFxpmmh1i5//GtIlkzFTYGQPJY
 Udh2C4FBT+MgfVnX2zCNmCv//Jyp9NKqVfbhWmrAg+sVOAwRuc0KNGb1G4L6ZG589q+MrOWQ3
 cPYRnwhnKmxHncMvOg/xz8omOlqFtBEGIcDVnCcausdi8BLCdOMiI+eSfYubHZYroUwqiKMQh
 snAVD7inMvVtP/jGr+y8vOmwXd9EisVAE6O27EN8iJ+wKgJR1UjdXvutVa9sHP4FECAr80DO1
 YjZWHIznBJJnjbUr1ClwDZoI3pz9EpAxe90OZbs9ypvOUSRk/SPUUdP9jUNWyikRRBOYR0I9z
 NVvYsFl0l4Rpn58xTmeoezAozwrKaU6rfl4cf2fHoI4OZKxZtdKuyJsvCQrOmNnQhCKl4oDNm
 BdHZFgdfbFpIovC6Cg8UCPfE6ASPrA9YZY/UPjrPGpEKvJUQPaTTQp7YtR7mfyy1xgEcnmZ8/
 uCaEDapbHeIvjm7hePJ22bgNHiWpKUcfcB1dXzcVhs9RoSIeDkxWE1CWIZYLYspMh3yIjL05x
 dgv6I/LE0Fz6gDOKb32rEa276h76Yt5bP/hXvsSkRpW8cWdfSSe0idQ6Cfo217dMO5Gn4Mgfn
 WXC+EVuGsqBFKt6yocA2CS7bWtD0hGJsR1kwX+7wf0JUzGA1e0tq+8C/xNGcWRrNGOkfhwGyU
 m5uQrKbfXi7iMHfsGpD6xNu3PxMF7OUav2+fzT0ur/DV0W22cdwHCmfpG/5pcYIIBTRiWP90c
 iW++oQPLJFNaI05O79WyUf+yUwn+zmdlwhEMR9DKYmUV2WiuR9+gGDylvd3QhIq8hpfd+EpNf
 aiWAEHD7hrCdh4snE
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 03 Apr 2020 19:37:29 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 03 Apr 2020 19:30:41 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Fri, 03 Apr 2020 19:37:25 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr,
        Allison Randal <allison@lohutok.net>
Subject: [Cocci] [PATCH] Coccinelle: zalloc_simple: Fix patch mode for
	dma_alloc_coherent()
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

Commit dfd32cad146e ("dma-mapping: remove dma_zalloc_coherent()"), in
removing dma_zalloc_coherent() treewide, inadvertently removed the patch
rule for dma_alloc_coherent(), leaving Coccinelle unable to auto-generate
patches for this case. Fix this.

Fixes: dfd32cad146e ("dma-mapping: remove dma_zalloc_coherent()")
CC: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Alex Dewar <alex.dewar@gmx.co.uk>
---
 scripts/coccinelle/api/alloc/zalloc-simple.cocci | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/coccinelle/api/alloc/zalloc-simple.cocci b/scripts/coccinelle/api/alloc/zalloc-simple.cocci
index 26cda3f48f01..c53aab7fe096 100644
--- a/scripts/coccinelle/api/alloc/zalloc-simple.cocci
+++ b/scripts/coccinelle/api/alloc/zalloc-simple.cocci
@@ -70,6 +70,15 @@ statement S;
 - x = (T)vmalloc(E1);
 + x = (T)vzalloc(E1);
 |
+- x = dma_alloc_coherent(E2,E1,E3,E4);
++ x = dma_alloc_coherent(E2,E1,E3,E4);
+|
+- x = (T *)dma_alloc_coherent(E2,E1,E3,E4);
++ x = dma_alloc_coherent(E2,E1,E3,E4);
+|
+- x = (T)dma_alloc_coherent(E2,E1,E3,E4);
++ x = (T)dma_alloc_coherent(E2,E1,E3,E4);
+|
 - x = kmalloc_node(E1,E2,E3);
 + x = kzalloc_node(E1,E2,E3);
 |
--
2.26.0

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

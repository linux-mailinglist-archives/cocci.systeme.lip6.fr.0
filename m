Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E002E8922
	for <lists+cocci@lfdr.de>; Tue, 29 Oct 2019 14:14:56 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9TDESKB008052;
	Tue, 29 Oct 2019 14:14:28 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0252777CC;
	Tue, 29 Oct 2019 14:14:28 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 597C6454C
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 14:14:25 +0100 (CET)
Received: from shiva.jussieu.fr (shiva.jussieu.fr [134.157.0.129])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9TDEOFZ026727
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 14:14:24 +0100 (CET)
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 by shiva.jussieu.fr (8.15.2/jtpda-5.4) with ESMTP id x9TDDwkh026800
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 14:14:24 +0100 (CET)
X-Ids: 164
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x9TDD9kA026147
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 22:13:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x9TDD9kA026147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1572354790;
 bh=DFJCAzizH4g10ADI9Rn27rAUxoPMKfPEwBoru1VHVxA=;
 h=From:Date:Subject:To:Cc:From;
 b=reO02uSbAHEiFpcpuoY5UJNhpn0kLh5Dj2QO71BSTK3k3pwXlQDuuAtgPWtz3zNIH
 NfPDCNagWGZDJY7oPXPs/Ps/0Pe/9cNig5HWLYrnpFiCtrm8o3GvrAT0ia1hlY9INT
 MvuDMWB4G82zqXlOGIX8Ism57sfinIjk5fYGTDVh7Fh5gosTU+HyPx4Au2c+g6lSal
 MNL6df8Hg+gKRg/3lAoTGrRZVUjMTMHQBuYEurTE2BvV4T95XenPDXPxgUliKdu//2
 XuCoraRjAn5byjZm3heDx9pTKoAEr5L+HIIaGnjJO8SuCAE+4mGgkxEE5OBbOS+Wua
 hMacoe4lqPsIQ==
X-Nifty-SrcIP: [209.85.221.174]
Received: by mail-vk1-f174.google.com with SMTP id e28so1813707vkn.12
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 06:13:09 -0700 (PDT)
X-Gm-Message-State: APjAAAWkUfO6oQpe78hZ2a/qjysJT4EuH66UNOmxpcolY8YdDF4Y/cWU
 aWrwEL4PqjYd4epwbI42mGTBQnlIUiGEm78wJjg=
X-Google-Smtp-Source: APXvYqwSk5zozYtnYOUFkJt9J/Q7e7F+pJLQ82qQ4jKDaoYaSEYkYBruilGg08QiiaIIzCBMAtQodOEwwSp+lok8Esw=
X-Received: by 2002:a1f:4b05:: with SMTP id y5mr11132787vka.12.1572354788616; 
 Tue, 29 Oct 2019 06:13:08 -0700 (PDT)
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 29 Oct 2019 22:12:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8Wi1zED0rYJhk9tYi5-jgCoyeHNtofvgKet4ZTzKFcA@mail.gmail.com>
Message-ID: <CAK7LNAQ8Wi1zED0rYJhk9tYi5-jgCoyeHNtofvgKet4ZTzKFcA@mail.gmail.com>
To: Matthias Maennich <maennich@google.com>, Jessica Yu <jeyu@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>
X-Miltered: at jchkmail2.reseau.jussieu.fr with ID 5DB83B16.000 by Joe's
 j-chkmail (http : // j-chkmail dot ensmp dot fr)!
X-j-chkmail-Enveloppe: 5DB83B16.000 from
 conssluserg-04.nifty.com/conssluserg-04.nifty.com/210.131.2.83/conssluserg-04.nifty.com/<yamada.masahiro@socionext.com>
X-Scores-Stats: 5DB83B16.000 B=0.50000 L=0.37561 G=0.37561 Disagree Winner=PH
X-Label-Query: YES
X-j-chkmail-Score: MSGID : 5DB83B16.000 on shiva.jussieu.fr : j-chkmail score
 : XX : R=. U=. O=. B=0.376 -> S=0.376
X-j-chkmail-Status: Unsure
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 29 Oct 2019 14:14:30 +0100 (CET)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 29 Oct 2019 14:14:25 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [Cocci] Warning message from 'make nsdeps' when namespace is lower
	cases
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

Hi.

When I was playing with 'make nsdeps',
I saw a new warning.

If I rename USB_STORAGE to usb_storage,
I see 'warning: line 15: should usb_storage be a metavariable?'
Why? I think it comes from spatch.
It should be technically OK to use either upper or lower cases
for the namespace name.


Just apply the following, and try 'make nsdeps'.


diff --git a/drivers/usb/storage/Makefile b/drivers/usb/storage/Makefile
index 46635fa4a340..6f817d65c26b 100644
--- a/drivers/usb/storage/Makefile
+++ b/drivers/usb/storage/Makefile
@@ -8,7 +8,7 @@

 ccflags-y := -I $(srctree)/drivers/scsi

-ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_STORAGE
+ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=usb_storage

 obj-$(CONFIG_USB_UAS)          += uas.o
 obj-$(CONFIG_USB_STORAGE)      += usb-storage.o










-- 
Best Regards
Masahiro Yamada
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

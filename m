Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41C4E3BE
	for <lists+cocci@lfdr.de>; Fri, 21 Jun 2019 11:38:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5L9bxkn019471;
	Fri, 21 Jun 2019 11:37:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id F3F66776C;
	Fri, 21 Jun 2019 11:37:58 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0B12A776C
 for <cocci@systeme.lip6.fr>; Fri, 21 Jun 2019 11:37:57 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5L9bqDc016539;
 Fri, 21 Jun 2019 11:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561109844;
 bh=kT4uxcn8PVrD/eGpDIX0oHe4BUNKCY9msva6hg3SIZQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=TD4qocmgEZ9An9idJU6ffuqI+DiOJf8r3XHj1NmfILGML2HXRs16i8WntIYUY/Y76
 HgSbUSodbag7XqyEEUN6fjq2485zpYom/Cx2zJ+qaJBcFILN22A45P1Zu7Rxvq3ozF
 sk2tjfzaseCibihOgoEkzC2LzF7LzLPFiPevg69Q=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.156.129]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MRUBA-1i2Uwe17Hs-00ShUz; Fri, 21
 Jun 2019 11:37:24 +0200
To: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <alpine.DEB.2.21.1906202046550.3087@hadrien>
 <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
 <alpine.DEB.2.21.1906202110310.3087@hadrien>
 <13890878-9e5f-f297-7f7c-bcc1212d83b7@web.de>
 <alpine.DEB.2.20.1906211119430.3740@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <15ca8d4b-e2d0-f021-de6e-c929cf3e1039@web.de>
Date: Fri, 21 Jun 2019 11:37:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1906211119430.3740@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:u7gPVXMyt/am6ioNH4VSIIFCmOT+btfvIGfJ1Ix/khkhdwc7CIr
 NfWagkfmmIoKJfdyXSCTjMGtZ0tXS413CNLldTiiRVJnl3jE3RVjzUesOQ0tw2osb6FK4Rv
 LtPhN1dO+v7flAaoXNAtVwXnaFqn3i7B0CbMd5B5ZHp5rIq/k73nWwBzQ1yMFrNkk2Fvy/l
 JB1eyQmpkb7if8HTSfv4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ujdmrse1UAA=:eKcdsKUKU7NCDrs12IR7rO
 PyKP5wHeDosUjD4cW68XYIZWESL9gwFmNGMojCtJn3a8Am6XM+dk+7gS43JBWw2POzLhYlY0i
 diHr2KHnqDQZACyKGE7hY+I1Hg0XNRmJ05eFMhSGlUJ49CMQ4ZSx27FdfxxFCGT3Rpde58lBK
 799Oi/7SxkV/uvBIH18CmvhYvorLLAQHkgpd2ApzJ9iRlJpsyxMvNlaOVmZnijhqKtvnVmHin
 m7jQ4DBQqUNxlwclWED2kIfdpsBcxgHkR+TLA6Pk9Qle1vSidxYfQUCLe3LfaYw+7Ba02Pxq9
 S66HKggxuYZAnOgls2Kz3+jsaiFe5oNYGDl4GEqVnBVzshE3ZdLt8b71K2jeT+sqkFbffr3ng
 BeK+87oYtGC8tXS9Rg5vDVc/Loq9RHyngIQwPsjcCe+oyNDlSoH8d1MY7jcTJcascsIb+vZbP
 Glxa0q71SozzloGWLeDs6xSED+GS/tn64AX8KTzOJIrrWGTBQ922F4uPHZ5uxLR2lkRVr/H2j
 yDv2HyYS2YA8KENNGkDnC7IHOENiwORz4UC9NuMfSjzqfhbXkegqTu2yd9tQxfBTjRgtzfPVI
 xsKO6VFXKn9DtwIJe4PjwZX3G+w0dEGdjma/+02h/krrOWHVXB2S7pC9dv3+8IAcgvDZJtsHe
 rXSmopLDUOc5aGADF4AtPm0OEudBKsiiOpH8DA4DRxWAEI2SRBzFtwA/4RHzHM94XLYUMWalW
 5rhTc07BHJTtMaH8kQqDno85yvtuxbEVKcaphohSACLytkeer/UWJZV7RQULQCRwtKYaieFsz
 6/Uayw38D7oJMOnXUwtk7YZreCztey+Og0zjFDzs25YXe5lzglz9Octu0I0M4eql/IXbxhRLF
 gPtMT9r7QOrN7OWYFx9sz9Qq1Qq4xZ6XBGM+PhOLvLklqLCTWEXqaY+8zMQU7pbc+MqGXGiUP
 dcPENdluTfQdkkFrOzqYfubq8wOHZ1uElVM/VChmIJbbOIUVjuGa3
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 21 Jun 2019 11:37:59 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 21 Jun 2019 11:37:53 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        LKML <linux-kernel@vger.kernel.org>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Coccinelle: Add a SmPL script for the reconsideration
 of redundant dev_err() calls
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

> I still don't see the point of specifying return.  Why not just S, where S
> is a statement metavariable?

Do you find the following SmPL change specification more appropriate?

@deletion depends on patch@
expression e;
statement s;
@@
 e = devm_ioremap_resource(...);
 if (IS_ERR(e))
(
-{
-   dev_err(...);
    s
-}
|
 {
 <+...
-   dev_err(...);
 ...+>
 }
)


Will any additional constraints become relevant?


>> Would this approach need a version check for the Coccinelle software?
>
> Why would that be necessary?

I guess that the application of SmPL disjunctions for if statements
can trigger development concerns.

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

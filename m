Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08D187B9E
	for <lists+cocci@lfdr.de>; Tue, 17 Mar 2020 09:57:29 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02H8v9aS017453;
	Tue, 17 Mar 2020 09:57:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 358D2781F;
	Tue, 17 Mar 2020 09:57:09 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5CDE83B93
 for <cocci@systeme.lip6.fr>; Tue, 17 Mar 2020 09:57:08 +0100 (CET)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02H8v76N002333
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Tue, 17 Mar 2020 09:57:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1584435425;
 bh=7t50olrQkpuZ4PmNbbA/f54VnXXwzXQGofrdzewewq8=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=h/23tfGvLkgZoNlvVgCIKtRax7GZKdP8zEu+W8R2dZG/azdkSbcIsnLV8mheHVosU
 s2n6Czg7fEIOsYB8WyflceqYEF6FROPNoKerlXdfkWyiYAmAcktzCAr5MBZsDuAO8v
 MsWRU3Eqc3ma4u2Mo5hOR8HxHxEIfrNFGKiCmlqc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.173.244]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LtWo4-1jNzs51X1g-010xD5; Tue, 17
 Mar 2020 09:57:05 +0100
To: Julia Lawall <julia.lawall@inria.fr>,
        Jaskaran Singh <jaskaransingh7654321@gmail.com>
References: <4d55d76c-29d1-1c88-d8ad-606e32a938d9@web.de>
 <3a335c7aef78ea5762248484a645eb5ff27b973c.camel@gmail.com>
 <934ab7fb-87cc-b81a-6e5e-1eb601a81c88@web.de>
 <alpine.DEB.2.21.2003170953340.5634@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <7f34f4d1-076d-f035-b16b-a9ce010a1d02@web.de>
Date: Tue, 17 Mar 2020 09:57:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003170953340.5634@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:9+IwhsdS/aseEp7QvzU0+RkMNpNK2ivinXKN+JFuUoTZC/Tgoji
 cKxzscB7xy8M3XC64DkwDqdxqFlM9XRVrylAiR26xXMUTlHZGQFcimBDhcisdMqkauLZmF/
 utDFI3gW+M81ZW2PtoaKPO7OS/cm+jvy6w/FpUAblvAiAS6O+02tJcmzUm0bwrMtSZepwhn
 r1neBZkm+pggAWN6tEATg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7i4ppZPXkKw=:i7tRO1d5OCVVYk0jD39g/j
 D13dVmBQU2vec2/p36UmWOcOCYlf+jSJrAyJNUsdAFMFqHJc6BZe1Mmo0RVfEs0efauPBgtNo
 /QhBNoEYudP06wSLPaBhCohvC8x0SVT77RT7ZuIOlyTcXvxji0PE3jZhpcfWOwrYdgyPPlxVn
 WORyMl3dwZFPVEgp77c3Ut2960cTFPV0x+xBfkkoF+Hh/APwCJ+SMC+iSRYBjrb129BxrZV3D
 7L1Iylntfon6ZaqOwWTjDt55EPa1Fgw+ogGB3m10rAs+knJJ6L8BuQWZOltyz2Ieepdn5S7NE
 SPgvELjyld+v9X+t16m4ySxQ2P4GPT5EGKxTGlq4VDXw+z17AvSsXbJG7+RS7j3A/clCvKzqi
 drJ5R2qFZ/ztuIe4DCZ3IWalDFs/OOVfOTGVu/A0wX2oZt//0i2at1jci2OtPLswYEMqnW+QE
 iGG5IiD+nHPlx0Qh7u6TxSx5xsRfTOz6Bn3Urt20mWJ6ODLrIXmPTdGTsQxqPhkaq/QgVpRiT
 DggpZWiipIFhCHAq+ZBj2aZ5GXaLkuL1oSJRGcPTBM9bVCatyYX8gDuDGoOpgHVePTRT1BYe0
 HDvc2IZV4CyHG2unL/AZuba972DLw/s2C8acFoavgBhwW0eo9zqu21sNwcQrukgb1cNEP1DKG
 Dbxr7j4cUaaSaVaTg49vsc6grmLUi4MJ4G9VAB9ymMooWrTy4QJdfm4OeQj5XgW2czeY6uEDZ
 1C/n9MFJcppIWmhldEcCt+3FlyIux/usp54WZjeSto0iw6ppYpi+UPcMke6aw2huNS4y4SyVK
 QG2Iv2b+DriWJKFMJwoIKIjEI4vaMACuBC9TkeujZyOrRegvW2pL4kKo0xKzIBW97VkMmj9MO
 3ruLO2nTswK2jlQ/9jzd4hQUjh2G2gblluaJcjpVI5oz8oCXqgXtCYsCsw0AUn4ULbd8BSZ1x
 4FD0BGRVTgJNrG1qGsu6yTZPYmendyE8Dodi9dmBNccWSXrPJ+E5Slk2tPGRcoYxTM03a04Rs
 A08+XVE42IN26/Fx0PsYcWIPfTNIFP3UV4fvnPdSEGxv4H+UBch/Xj+uoAaFDECzxEtzkkZ/V
 u8HbBX39q6sxOIgbybSguqjSbhJg2bzx1aC6+YtL5KAYiW5n6n7JsmlENZb00pnWLWBd1ukdO
 DrSp/sMr+A2SmOdIYLJ/8jftqOT9E6zyXFwlK8lsMMTBCiymAp66zCTLCk60HgwD9pI9glcNT
 IlOTpmtsTuwEhcG1O
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 17 Mar 2020 09:57:09 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 17 Mar 2020 09:57:07 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [06/26] parsing_cocci: arity: Add cases for
 ParenType/FunctionType
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

>> I got special views also around patch squashing.
>> Would you like to reduce the number of update steps
>> according to the really desired software transformation?
>
> I asked him to cut it up into small chunks.

We come along different preferences for the size of these pieces.

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2795EB61EB
	for <lists+cocci@lfdr.de>; Wed, 18 Sep 2019 12:58:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8IAubSf002683;
	Wed, 18 Sep 2019 12:56:37 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E7D4677AA;
	Wed, 18 Sep 2019 12:56:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5346B7796
 for <cocci@systeme.lip6.fr>; Wed, 18 Sep 2019 12:56:34 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8IAuXp8018307
 for <cocci@systeme.lip6.fr>; Wed, 18 Sep 2019 12:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1568804190;
 bh=mTFyej69qaF15R5Yk0FIAM5L/SarJWs8GoUYMRNcreY=;
 h=X-UI-Sender-Class:To:References:Subject:Cc:From:Date:In-Reply-To;
 b=Cqh4Bl1wya71HoA/VC959K8YEiomY0JWN3lebIfmNpDiArqCYHIORsx/xcOctK3Ku
 b8TFO4PQ0AihCeqkDuecppuUW8TW7rsOwVmZSh2AEHEY4YjQ7TBniOK2WccmdsNpo/
 a7jakRK3yNDKozhNbDmPRJlvsEtaJaXbvxfBdKQQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.2.101]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lr2I7-1hfcnF2pBj-00eZi1; Wed, 18
 Sep 2019 12:56:30 +0200
To: "Richard W. M. Jones" <rjones@redhat.com>
References: <20190917114803.GB15492@redhat.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9427d75f-a9ee-cc31-904b-187df9c403c0@web.de>
Date: Wed, 18 Sep 2019 12:56:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190917114803.GB15492@redhat.com>
Content-Language: en-US
X-Provags-ID: V03:K1:Tx3THvpfuCBw3SQ36mUBXQtaa0rBpwG8w8a7sazK7frbQjvxOfG
 xXunt/EBUltc/8FfH0Uh+Is05fUcjE/xSuezKpRf4ya2S7exJWKP+bV/gALHHMj03bOMgMp
 RteenJbR1QDsRv/PFPQwlO98ICDXoQYl9sTzIpk/AYh9sSikF7AzWmlpsHPpsXqVzWgcf5x
 X0YOruaN7yUkGhn8OJmEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kgq/bNA7Tbg=:eKooEBx3ib6Eyf9FpO6Hnd
 XOUmh8cYeGRdvaso16cfQR62TNE9Yb7LpxnfATu5K/iuuBTBKRCNECgxmyBmD7tu+FINEZiHp
 ciZNSB13DkNml5PxelfhXQkhh70HajfBWy8lHrkr6VR18KC1IRmP8jG4kI/z9FlDRg8K4wKmm
 sfoS3kjNFPBWkHdLvR13O9FZm8H5ipzv95yx8yfsgJpqfmb/OIDkkK/v9B0c0Wh2p/Fgs8ECS
 0NCDeku5NQvIY+E3wTQC/qZFXbTtfVnr0GViD4um/qErdR3MisvRkh+xFcILOgrA7XqRutq3K
 2TTJebM3xS1qSoF/z7C8V4MmjhWH/+sZxhSlj3NT/8mlGXXXXnzWv+8Z88+Vj0oQCX5AUHsSF
 xBT7mQkszU6Yn/9uqaX0q7tnIgwnsqDPnvOcAcZc83aqXRv0/w1GgP3SvISjoc0X2BStPRagv
 MAH8dd4gvBMi37QsJNPW/JCdFmqRgHVZhF2mlzLDmoQZRXKrmtNp7J5hleiUVtgqKR6PfgHGc
 50fD09CUZXzTYVz+HJOlIghc+sd1zMxVE1eDoPhP2/6xi4e/rWXg4JbUwY9bFkh2jtG8z8//7
 oTzNNPJfRcMwVO7g7FoHopULArT4UCQtL9JEKhxC8BDVTl4NFRQkB31LrXkApIKNnPJRmeahE
 7Q6Le4pFfpz5wLHr3ldure5SrSPUHe3c1sKRfuR6KhWGRTN6YFfaiXiQsM/MHC+EKzALymjTG
 eXRiGjRS628+SWsEviOrz3IGuRty4NGgvbjusvt+tRXHHk5DFytJhXsGTXaytMQBmKbai0sSQ
 1RSN1Be8y0iUL2VTwPPNSBTUVL7jzedWNCf7ECBqkvp7xwPpAdyAX3FueShiVxCcckAtFh5Er
 L3t1vmLDmKFnwoZUMyw9cu+vspVCq7mm8ALQFywF/4LdZsAOGGQEQApM7xomDe0U3Y0P4Zz0H
 yhc3Q89RSbBnGJu1xgqR3oPV6WfE9wYWAciTpwMjUt2wwjwjFERzslKr+Ofq6GjZyyTHxL0ij
 RMZDtafsnvbwTYSWEFBSMvSSPOBtLSJOJ8LVbycH7943FQUmLfO5poGthMVbU9PzWF4Ms+HyG
 OAsO1iM1w0/jLC/ddJHSybk+U1H265fn0ZEANbAv+U7PEG/OebYW07HO2oV0IKg/0RJad5zU3
 A4BJr156yNPxQZxZYAcit2rHZdPSe482N2hp+8Yl4nRRrwy5qUzmpOiWOS0rxlzr46LnHEzH4
 SOn28tt0wbNDR/oBsyv7xY0xfEVIIomaFoyvqE+uAbUKKa7kajNqKNd4NpiE=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 18 Sep 2019 12:56:38 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 18 Sep 2019 12:56:33 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Compiling with OCaml 4.08
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

> https://bugzilla.redhat.com/show_bug.cgi?id=1734855#c12

Would you like to achieve the contribution of additional
software development resources so that more improvements
would become possible by easier ways?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

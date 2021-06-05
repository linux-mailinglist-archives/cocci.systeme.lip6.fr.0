Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2720239CB4D
	for <lists+cocci@lfdr.de>; Sat,  5 Jun 2021 23:42:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 155Lfnbq016364;
	Sat, 5 Jun 2021 23:41:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 72F3677F5;
	Sat,  5 Jun 2021 23:41:49 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4388B74E8
 for <cocci@systeme.lip6.fr>; Sat,  5 Jun 2021 23:41:47 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 155Lfkek019361
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 5 Jun 2021 23:41:46 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AjvoGi6ktM63SPelAujqxAIYZqwfpDfIT3DAb?=
 =?us-ascii?q?v31ZSRFFG/FwWfre5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEgg?=
 =?us-ascii?q?qVxeNZnO/fKlTbckWUygce78ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jj?=
 =?us-ascii?q?Jr5WIz1XVw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.83,252,1616454000"; d="scan'208";a="383567989"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2021 23:41:46 +0200
Date: Sat, 5 Jun 2021 23:41:46 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9pYTPZwuro-L+hHTd1NFG2v9hvx=2i43BNw2f-1ywkJxg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2106052341340.32368@hadrien>
References: <CAHmME9rRQmSLkU6ELNiC=pr-D7CGjdyw27_oXdBp+hMdn8WQ5Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2106051335410.25155@hadrien>
 <YLvDVI9TCEVoL16r@zx2c4.com>
 <alpine.DEB.2.22.394.2106052149580.32368@hadrien>
 <CAHmME9qukRfmo9ooa4O-2Z1CbdZaGxY70JiHgwD4QiaYTr100g@mail.gmail.com>
 <alpine.DEB.2.22.394.2106052248370.32368@hadrien>
 <CAHmME9pYTPZwuro-L+hHTd1NFG2v9hvx=2i43BNw2f-1ywkJxg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 05 Jun 2021 23:41:50 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 05 Jun 2021 23:41:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] struct type renaming in the absence of certain function
 calls on members
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



On Sat, 5 Jun 2021, Jason A. Donenfeld wrote:

> That makes sense. Thank you so much for your help. Committed here (and
> credited you as co-author):
> https://git.zx2c4.com/wireguard-freebsd/commit/?id=b13579613ffcbe56c28df79972a74025007a85b7

Cool.  Thanks :)

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

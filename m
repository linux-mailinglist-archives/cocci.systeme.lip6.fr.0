Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59025FB9D
	for <lists+cocci@lfdr.de>; Mon,  7 Sep 2020 15:47:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 087Dkn0R021958;
	Mon, 7 Sep 2020 15:46:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2EC8477BF;
	Mon,  7 Sep 2020 15:46:49 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D3DBF4316
 for <cocci@systeme.lip6.fr>; Mon,  7 Sep 2020 15:46:46 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 087DkjnG015544
 for <cocci@systeme.lip6.fr>; Mon, 7 Sep 2020 15:46:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; d="scan'208";a="466420197"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 15:46:44 +0200
Date: Mon, 7 Sep 2020 15:46:44 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <46d314d5-822e-3d73-2d70-015794556e56@web.de>
Message-ID: <alpine.DEB.2.22.394.2009071544460.2476@hadrien>
References: <25b804fd-0d04-475d-f614-26c03c9fd544@web.de>
 <5f9fdd59-4b0b-1cb5-c3a2-92efc5bb3841@web.de>
 <alpine.DEB.2.22.394.2009071357140.2476@hadrien>
 <477abcea-e008-e509-d03f-f2753ebdfb20@web.de>
 <alpine.DEB.2.22.394.2009071506350.2476@hadrien>
 <46d314d5-822e-3d73-2d70-015794556e56@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 07 Sep 2020 15:46:49 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 07 Sep 2020 15:46:45 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        LKML <linux-kernel@vger.kernel.org>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci]
 =?utf-8?q?=5BPATCH=5D_Coccinelle=3A_api=3A_Add_SmPL_scrip?=
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

> >>>> +@replacement depends on patch@
> >>>> +expression base, device1, device2, index, private, resource;
> >>>> +@@
> >>>> +(
> >>>> +-resource = platform_get_resource(device1, IORESOURCE_MEM, index);
> >>>> + base =
> >>>> +-       devm_ioremap_resource
> >>>> ++       devm_platform_get_and_ioremap_resource
> >>>> +                             (
> >>>> +-                             &
> >>>> +                               device1
> >>>> +-                                     ->dev
> >>>> +                              ,
> >>>> +-                             resource
> >>>> ++                             index, &resource
> >>>> +                             );
> >>>> +|
> >>>> +-private->res = platform_get_resource(device1, IORESOURCE_MEM, index);
> >>>> + base =
> >>>> +-       devm_ioremap_resource
> >>>> ++       devm_platform_get_and_ioremap_resource
> >>>> +                             (device2,
> >>>
> >>> It is very suspicious that in one case you change the first argument of
> >>> devm_platform_get_and_ioremap_resource and in one case you don't.
> >>
> >> I noticed a few special cases during my source code analysis approach.
> >
> > This is not a reasonable answer.  Does the rule work correctly or not?
> > If it doesn't work correctly, it needs to be removed.
>
> Both source code change patterns from these branches of a SmPL disjunction
> work as I would expect it by the current Coccinelle software.
> Would you like to clarify any remaining related open issues?

In one case the first argument of devm_ioremap_resource has to be changed
to produce the first argument of devm_platform_get_and_ioremap_resource
and in the other case there is no such change.  "work as I would expect"
is not a proper explanation of why this is correct.  Maybe you can point
to some previous commits that have made the change in this way.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

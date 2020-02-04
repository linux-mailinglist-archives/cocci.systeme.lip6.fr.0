Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A6151B9F
	for <lists+cocci@lfdr.de>; Tue,  4 Feb 2020 14:47:20 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 014Dl4nr020485;
	Tue, 4 Feb 2020 14:47:04 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2508477F9;
	Tue,  4 Feb 2020 14:47:04 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 772A977E8
 for <cocci@systeme.lip6.fr>; Tue,  4 Feb 2020 14:47:02 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 014Dl1Sm006689
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 4 Feb 2020 14:47:02 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,401,1574118000"; d="scan'208";a="338022494"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 14:47:01 +0100
Date: Tue, 4 Feb 2020 14:47:01 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <6debc5f9-839a-1b7f-7d11-cd7a7c6b3866@web.de>
Message-ID: <alpine.DEB.2.21.2002041446400.3456@hadrien>
References: <72729ef6-f8df-942f-57aa-4b3fac75a20d@web.de>
 <CAAJnyheEpd44ShTijdOAq6QZ9dyjJ387dcJDHg5qcd4aN90PYw@mail.gmail.com>
 <5fe198eb-2e43-4ae3-f82a-e7bcfc394623@web.de>
 <alpine.DEB.2.21.2002041418420.3345@hadrien>
 <6debc5f9-839a-1b7f-7d11-cd7a7c6b3866@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 04 Feb 2020 14:47:04 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 04 Feb 2020 14:47:02 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Wellington Wallace <wellingtonwallace@gmail.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Replacing a std::string check by strcmp() with SmPL
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



On Tue, 4 Feb 2020, Markus Elfring wrote:

> >> @replacement@
> >> constant c;
> >> identifier text;
> >> statement is, es;
> >> @@
> >>  <+...
> >
> > What is thhe point of the outer <+... ...+>?
>
> I would like to stress the possibility that source code adjustments
> can be performed multiple times.
> https://github.com/coccinelle/coccinelle/blob/a549b9f0a20e14fe9c36f45990b40dc5708ef8f2/docs/manual/cocci_syntax.tex#L696

Perhaps, but it will unnecessarily raise the running time of your semantic
patch.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

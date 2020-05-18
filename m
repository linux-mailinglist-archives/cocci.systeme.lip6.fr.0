Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEAE1D758E
	for <lists+cocci@lfdr.de>; Mon, 18 May 2020 12:50:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04IAogRS013192;
	Mon, 18 May 2020 12:50:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0411F777D;
	Mon, 18 May 2020 12:50:42 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3C99D3D0F
 for <cocci@systeme.lip6.fr>; Mon, 18 May 2020 12:50:40 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04IAod15002110
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 18 May 2020 12:50:39 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,407,1583190000"; d="scan'208";a="348920946"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2020 12:50:19 +0200
Date: Mon, 18 May 2020 12:50:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e3d5a92f-0c78-c1ca-47ab-d2bb2864efaa@web.de>
Message-ID: <alpine.DEB.2.21.2005181248310.2467@hadrien>
References: <4a677190-b494-138c-4782-eec033a77377@web.de>
 <alpine.DEB.2.21.2005181118540.2467@hadrien>
 <0a93e321-42de-3534-9c4a-d67132a1289e@web.de>
 <alpine.DEB.2.21.2005181217580.2467@hadrien>
 <8f3cbbd1-653e-ab2d-5a41-18eec00ae828@web.de>
 <alpine.DEB.2.21.2005181234210.2467@hadrien>
 <e3d5a92f-0c78-c1ca-47ab-d2bb2864efaa@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 18 May 2020 12:50:42 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 18 May 2020 12:50:39 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Chuhong Yuan <hslester96@gmail.com>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] How to match function calls in macros?
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



On Mon, 18 May 2020, Markus Elfring wrote:

> >>> If the developer forgets the \ there would likely be a parsing problem.
> >>
> >> I find it helpful to clarify parsing challenges around such an use case.
> >> It might occasionally be relevant if a line continuation indication
> >> was accidentally forgotten or was intentionally omitted.
> >>
> >> * Source code review should point such questionable places out, shouldn't it?
> >>
> >> * How much does this implementation detail matter for the safe application
> >>   of the semantic patch language?
> >
> > This is not Coccinelle's problem.
>
> This software is also involved then.
>
>
> > A developer can run a compiler to check for parsing errors.
>
> I imagine that a missing line continuation can be hard to detect
> and report as a possible programming error because the corresponding
> code parts can still be valid on their own according to special circumstances.

If they are valid, then what is the problem.  Neither a compiler nor
Coccinelle can know what the developer intended.

> Can the semantic patch language help to insist for a search that a bit
> of source code belongs to the implementation of a function-like macro?

That's what the search that was written does.  The pattern that comes
after #define has to be in the definition of the macro.  Coccinelle never
matches things in more than one top-level term in the C file.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

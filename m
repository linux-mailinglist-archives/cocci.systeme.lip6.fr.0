Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 285AA31AE23
	for <lists+cocci@lfdr.de>; Sat, 13 Feb 2021 22:38:47 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11DLcFnv011099;
	Sat, 13 Feb 2021 22:38:15 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3D98A77DD;
	Sat, 13 Feb 2021 22:38:15 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1E68824DD
 for <cocci@systeme.lip6.fr>; Sat, 13 Feb 2021 22:38:14 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11DLcDMX018632
 for <cocci@systeme.lip6.fr>; Sat, 13 Feb 2021 22:38:13 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,176,1610406000"; d="scan'208";a="372986579"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2021 22:38:13 +0100
Date: Sat, 13 Feb 2021 22:38:13 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Taylor Blau <me@ttaylorr.com>
In-Reply-To: <YChDSqSeMgNAAbDJ@nand.local>
Message-ID: <alpine.DEB.2.22.394.2102132226170.2720@hadrien>
References: <YCKi4Ca0RbcfZLRB@nand.local>
 <alpine.DEB.2.22.394.2102121506050.9350@hadrien>
 <YChDSqSeMgNAAbDJ@nand.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 13 Feb 2021 22:38:15 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 13 Feb 2021 22:38:13 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Missing package for Ubuntu 20.04 LTS?
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



On Sat, 13 Feb 2021, Taylor Blau wrote:

> Hi Julia,
>
> On Fri, Feb 12, 2021 at 03:06:16PM +0100, Julia Lawall wrote:
> > > Is there a planned release of coccinelle that will appear in the focal
> > > suite?
> >
> > Can you use the PPA?
> >
> > https://launchpad.net/~npalix/+archive/ubuntu/coccinelle
>
> Yes, we could. But it's an extra step that all users of Ubuntu Focal
> will have to take. Note that 20.04 is the image that all users of
> GitHub Actions' "runs-on: ubuntu-latest" get, so anybody in that group
> who wants to use coccinelle will have to configure and install from the
> PPA.
>
> Is there a reason that 20.04 was skipped when preparing a release for
> the official suites?

We don't do this.  I don't know who does it.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8E0D6495
	for <lists+cocci@lfdr.de>; Mon, 14 Oct 2019 16:03:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9EE3a5K005683;
	Mon, 14 Oct 2019 16:03:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1728B77C3;
	Mon, 14 Oct 2019 16:03:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 69B9F7792
 for <cocci@systeme.lip6.fr>; Mon, 14 Oct 2019 16:03:34 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9EE3YgA002493
 for <cocci@systeme.lip6.fr>; Mon, 14 Oct 2019 16:03:34 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,295,1566856800"; d="scan'208";a="322647124"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 16:03:33 +0200
Date: Mon, 14 Oct 2019 16:03:33 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <c03fd3e3-685b-1305-54c0-e3063201cd31@suse.com>
Message-ID: <alpine.DEB.2.21.1910141602130.2330@hadrien>
References: <56e7bd73-5b50-ddeb-9a56-62daf93eb015@suse.com>
 <alpine.DEB.2.21.1910112200230.3284@hadrien>
 <fb924870-4bc2-1ca0-4fa4-0ddbf7ebb9d2@suse.com>
 <alpine.DEB.2.21.1910141309080.2330@hadrien>
 <c03fd3e3-685b-1305-54c0-e3063201cd31@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Oct 2019 16:03:36 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Mon, 14 Oct 2019 16:03:34 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] macro parameters and expressions?
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

> > the macro is not valid C.  But it doesn't work if you add a semicolon at
> > the end either.  It seems that a sequence of statements is not supported
> > either.  On the other hand, if you transform it into a do while(0), even
> > with no trailing semicolon after the while (0) all is fine.
>
> This is not always possible. See the new example as attached.
>
> This is more like the original problem (stripped down a lot).

At the moment, a complete function definition is not possible.  But I know
that this is a common case.  I'll see if it can be added without adding
parsing conflicts.  A sequence of statements did not work for this reason.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

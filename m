Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4321545A3
	for <lists+cocci@lfdr.de>; Thu,  6 Feb 2020 15:01:16 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 016E0rGO014748;
	Thu, 6 Feb 2020 15:00:53 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AFDAC77FB;
	Thu,  6 Feb 2020 15:00:53 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 444DE77EE
 for <cocci@systeme.lip6.fr>; Thu,  6 Feb 2020 15:00:52 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 016E0pYv016003
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 6 Feb 2020 15:00:51 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,409,1574118000"; d="scan'208";a="434766993"
Received: from unknown (HELO hadrien) ([131.254.252.28])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 15:00:51 +0100
Date: Thu, 6 Feb 2020 15:00:51 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <f7da90d8cc0e609a2a81e7a041cc98afedb215b6.camel@gmail.com>
Message-ID: <alpine.DEB.2.21.2002061500370.2189@hadrien>
References: <132f414d-397f-fb9a-ff6e-5360df827147@web.de>
 <f7da90d8cc0e609a2a81e7a041cc98afedb215b6.camel@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 06 Feb 2020 15:00:55 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 06 Feb 2020 15:00:51 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
        Markus Elfring <Markus.Elfring@web.de>,
        "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH 2/2] tests: Add test case for matching pointers
 to const pointers (and variants)
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



On Thu, 6 Feb 2020, Jaskaran Singh wrote:

> On Wed, 2020-02-05 at 19:55 +0100, Markus Elfring wrote:
> > Would you like to avoid any abbreviations in the patch subject?
> >
>
> I used abbreviations to keep the patch subject short but still clear.
>
> Would the following be a better subject?
>
> "tests: Add test case to match const pointer variants"

OK for me.

julia

>
> Cheers,
> Jaskaran.
>
> >
> > > These types would not match previously.
> >
> > I imagine that this information can be improved for a nicer patch
> > description,
> > can't it?
> >
> > Regards,
> > Markus
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

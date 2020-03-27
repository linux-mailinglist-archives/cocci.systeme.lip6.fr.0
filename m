Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA19F195AD9
	for <lists+cocci@lfdr.de>; Fri, 27 Mar 2020 17:16:04 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02RGFeSW015070;
	Fri, 27 Mar 2020 17:15:40 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 992EE781F;
	Fri, 27 Mar 2020 17:15:40 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 062F8780C
 for <cocci@systeme.lip6.fr>; Fri, 27 Mar 2020 17:15:38 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02RGFaGi011213
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 27 Mar 2020 17:15:36 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,313,1580770800"; d="scan'208";a="442666116"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 17:15:36 +0100
Date: Fri, 27 Mar 2020 17:15:36 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <1f1a7b29-b767-551c-e2ec-d5cdf5ceecd0@linbit.com>
Message-ID: <alpine.DEB.2.21.2003271714150.2709@hadrien>
References: <b86347f3-69d3-0801-c91f-87c3424e71dc@linbit.com>
 <alpine.DEB.2.21.2003271645370.2709@hadrien>
 <1f1a7b29-b767-551c-e2ec-d5cdf5ceecd0@linbit.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-179480623-1585325736=:2709"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 27 Mar 2020 17:15:41 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 27 Mar 2020 17:15:36 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Matching against a declarer macro
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-179480623-1585325736=:2709
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 27 Mar 2020, Christoph Böhmwalder wrote:

> Am 27.03.20 um 16:47 schrieb Julia Lawall:> Are you sure that the C code is
> parsed successfully?  I'm not at all sure
> > that static is allowed in an argument list.  Types are allowed, bu static
> > is only part of a type.
>
> I'm pretty sure it is parsed successfully. At least spatch doesn't complain
> about it, no matter how many debug flags I specify.

Did you try spatch --parse-c file.c?

>
> I really only want to swap out the last parameter, but I'm having trouble
> coming up with the syntax. This should match, right?
>
> @@
> declarer name RB_DECLARE_CALLBACKS_MAX;
> identifier NODE_END;
> @@
> RB_DECLARE_CALLBACKS_MAX(...,
> - NODE_END
> + compute_subtree_last
>  );

If the code is getting parsed, this should be fine.

Do you want to actually match NODE_END?  If so, it shouldn't be declared
as a metavariable.

julia

> > For augment_callbacks, either identifier or expression would be fine.
> > Coccinelle has no idea what is going to happen to augment_callbacks
> > afterwards.  It just sees a sequence of characters and classifies it as an
> > identifier.
>
> That's what I thought, thank you for confirming.
>
> > julia
>
--8323329-179480623-1585325736=:2709
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-179480623-1585325736=:2709--

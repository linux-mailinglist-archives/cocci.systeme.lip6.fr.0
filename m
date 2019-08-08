Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E5C86086
	for <lists+cocci@lfdr.de>; Thu,  8 Aug 2019 13:02:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x78B1s6K021659;
	Thu, 8 Aug 2019 13:01:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 417427797;
	Thu,  8 Aug 2019 13:01:54 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A96847787
 for <cocci@systeme.lip6.fr>; Thu,  8 Aug 2019 13:01:52 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x78B1qdW012937
 for <cocci@systeme.lip6.fr>; Thu, 8 Aug 2019 13:01:52 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,360,1559512800"; d="scan'208";a="315924869"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 13:01:51 +0200
Date: Thu, 8 Aug 2019 13:01:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: =?ISO-8859-15?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <7e131616-a0c6-5b59-78b8-a92b569cda27@linbit.com>
Message-ID: <alpine.DEB.2.21.1908081259010.2995@hadrien>
References: <7e131616-a0c6-5b59-78b8-a92b569cda27@linbit.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1881600522-1565262111=:2995"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 08 Aug 2019 13:01:54 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 08 Aug 2019 13:01:52 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Remove entire multidecl
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

--8323329-1881600522-1565262111=:2995
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 8 Aug 2019, Christoph Böhmwalder wrote:

> So I've looked around in the demos/ and tests/ as well as the documentation,
> but I can't seem to figure out what I'm doing wrong:
>
> test.c
> ------
> int x, y;
>
>
> test.cocci
> ----------
> @@
> identifier x, y;
> @@
> - int x, y;
>
>
> Should be pretty straightforward, but the rule does not match. Is there
> another syntax to use here? In my real use case, I'm trying the same thing
> within a function, and that doesn't match either.
>
> Also, while playing around with it, I found this weird behaviour:
>
> @@
> identifier x, y;
> @@
> - int x;
>
> Yields:
>
> --- test.c
> +++ /tmp/cocci-output-6916-8bc8e1-test.c
> @@ -1 +1 @@
> -int x, y;
> +
>
>
> Not exactly what I expected...

SmPL doesn't support patterns with multiple variable declarations, because
there is really no way to tell whether they will be on one line or
multiple lines.

I'm not sure why the latter is not what you expected.  If you only
expected to remove the int x, then x should not have been an identifier
metavariable.

Basically, it is matching the pattern multiple times on the same code,
once for each variable.  If these matches cause all of the variables to go
away, the type and the ; are removed as well.

It seems that this resulted in adding a blank line.  That is indeed not
really ideal.

julia

>
> Thanks,
> --
> Christoph Böhmwalder
> LINBIT | Keeping the Digital World Running
> DRBD HA —  Disaster Recovery — Software defined Storage
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-1881600522-1565262111=:2995
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1881600522-1565262111=:2995--

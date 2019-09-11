Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C40ACAF799
	for <lists+cocci@lfdr.de>; Wed, 11 Sep 2019 10:19:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8B8JeEE003977;
	Wed, 11 Sep 2019 10:19:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EC20D77AA;
	Wed, 11 Sep 2019 10:19:39 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CCDE876D9
 for <cocci@systeme.lip6.fr>; Wed, 11 Sep 2019 10:19:37 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8B8JbiA003192
 for <cocci@systeme.lip6.fr>; Wed, 11 Sep 2019 10:19:37 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,492,1559512800"; d="scan'208";a="401199206"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 10:19:37 +0200
Date: Wed, 11 Sep 2019 10:19:38 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <0477cddd-0bbd-7e16-adee-91e7e9d3b5d4@web.de>
Message-ID: <alpine.DEB.2.21.1909111018350.2885@hadrien>
References: <0477cddd-0bbd-7e16-adee-91e7e9d3b5d4@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-548907850-1568189978=:2885"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 11 Sep 2019 10:19:41 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Wed, 11 Sep 2019 10:19:37 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking parsing difficulties around SmPL when
 constraints
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

--8323329-548907850-1568189978=:2885
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 11 Sep 2019, Markus Elfring wrote:

> Hello,
>
> A specific test case is available for the semantic patch language.
> https://github.com/coccinelle/coccinelle/blob/560c3d02e2085e83e9bcd40842eec7e774140131/tests/nest3.cocci
>
> Can the following code variant work also under other circumstances?

No, I don't think so.  I don't think that when is supported on
expressions.

julia

>
> @extra@
> expression x;
> position p;
> @@
> (sizeof(*(x@p))
> |__alignof__(*(x@p))
> )
>
> @display@
> expression action, x, y, z;
> position p != extra.p;
> statement es;
> @@
> *if (!x)
>  {
>     (<+... when != (x) = y
> (
> *   *(x@p)
> |   action(z,
> *          x@p
>            , ...)
> )
>     ...+>);
>  }
>  else
>     es
>
>
> elfring@Sonne:~/Projekte/Coccinelle/janitor> spatch --parse-cocci show_null_pointer_usage13.cocci
> …
> minus: parse error:
>   File "show_null_pointer_usage13.cocci", line 16, column 11, charpos = 178
>   around = 'when',
>   whole content =     (<+... when != (x) = y
>
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-548907850-1568189978=:2885
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-548907850-1568189978=:2885--

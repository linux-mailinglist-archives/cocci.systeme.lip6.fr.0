Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D844B117E
	for <lists+cocci@lfdr.de>; Thu, 12 Sep 2019 16:52:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8CEnveG008861;
	Thu, 12 Sep 2019 16:49:57 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 66D6777B2;
	Thu, 12 Sep 2019 16:49:57 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 673CD7797
 for <cocci@systeme.lip6.fr>; Thu, 12 Sep 2019 16:49:55 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8CEntv0013710
 for <cocci@systeme.lip6.fr>; Thu, 12 Sep 2019 16:49:55 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,497,1559512800"; d="scan'208";a="401459870"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 16:49:30 +0200
Date: Thu, 12 Sep 2019 16:49:32 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9ba987e2-c6a2-cf6a-5a94-8bf841a6e195@web.de>
Message-ID: <alpine.DEB.2.21.1909121648550.2876@hadrien>
References: <20190912123435.ztwsymd7m4s4n6hq@gintonic.linbit>
 <9ba987e2-c6a2-cf6a-5a94-8bf841a6e195@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 12 Sep 2019 16:49:58 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 12 Sep 2019 16:49:55 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] const in parameter lists
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



On Thu, 12 Sep 2019, Markus Elfring wrote:

> > drbd_submit_peer_request(...
> > -    , const unsigned op, const unsigned op_flags
> > +    , const unsigned rw
> >  ,...)
> > {
> > ...
> > }
>
> How do you think about the following SmPL change specification?
>
>  drbd_submit_peer_request(...,
> -                         const unsigned op,
>                           const unsigned
> -                                        op_flags
> +                                        rw
>                           , ...)
>  {
>  ...
>  }

It would really be helpful if you would actually test things before
proposing them.  This produces the same parse error as the other options.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

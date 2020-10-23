Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED792971FF
	for <lists+cocci@lfdr.de>; Fri, 23 Oct 2020 17:11:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09NFB2xZ016040;
	Fri, 23 Oct 2020 17:11:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8B8F177BF;
	Fri, 23 Oct 2020 17:11:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6FCB845D8
 for <cocci@systeme.lip6.fr>; Fri, 23 Oct 2020 17:11:01 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09NFB04x015347
 for <cocci@systeme.lip6.fr>; Fri, 23 Oct 2020 17:11:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,408,1596492000"; d="scan'208";a="474073911"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 17:11:00 +0200
Date: Fri, 23 Oct 2020 17:11:00 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <13dbaaf7-6655-7939-e173-310c45d1878e@web.de>
Message-ID: <alpine.DEB.2.22.394.2010231710010.2707@hadrien>
References: <CALogXGVr7OYtWhrsZg7gnO+czzu6eM_GGThYSCYezgUmVjwqZA@mail.gmail.com>
 <13dbaaf7-6655-7939-e173-310c45d1878e@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-165017204-1603465860=:2707"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 23 Oct 2020 17:11:02 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 23 Oct 2020 17:11:01 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Adjusting replacement lists with SmPL?
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

--8323329-165017204-1603465860=:2707
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 23 Oct 2020, Markus Elfring wrote:

> > I'd like to add a statement after another within a preprocessor expression,
> >
> > How do you think about to refer to a “#define directive”?
> >
> >
> > > but spatch adds the line without an escape (backslash).
> >
> > I imagine that we stumble on another target conflict here.
> > https://github.com/coccinelle/coccinelle/issues/139
> >
> > Do you really want to adjust a bit of text according to a preprocessing
> > definition?
> >
> >
> > >     #define X(a) x(a);
> > >
> > > (I know the above is not technically correct but it's super common.)
> >
> > I stumble on understanding difficulties for this information.
> > Would you like to clarify the knowledge about correctness a bit more?
> >
> >
> > >     @@
> > >     expression e;
> > >     @@
> > >         x(e);
> > >     +   y(e);
> >
> > How should the scope be specified that a change should be performed
> > only for preprocessor code (replacement lists for your transformation
> > approach)?

I don't think he is asking that.  He means, if the call to x happens to be
in a macro definition, how can he ensure that the transformed code treats
newlines in the right way.

julia


> >
> >
> > > I can think of two solutions, if an expression is inside a
> > > preprocessor statement: add a backslash before every newline, or skip
> > > the newline.
> >
> > Would you like to choose the preferred coding style for such an use case?
> >
> > Regards,
> > Markus
> > _______________________________________________
> > Cocci mailing list
> > Cocci@systeme.lip6.fr
> > https://systeme.lip6.fr/mailman/listinfo/cocci
> >
--8323329-165017204-1603465860=:2707
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-165017204-1603465860=:2707--

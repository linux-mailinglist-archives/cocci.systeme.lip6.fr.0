Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA895B0F1A
	for <lists+cocci@lfdr.de>; Thu, 12 Sep 2019 14:50:26 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8CCo5Ms017026;
	Thu, 12 Sep 2019 14:50:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A35DE77B2;
	Thu, 12 Sep 2019 14:50:05 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A2CC07797
 for <cocci@systeme.lip6.fr>; Thu, 12 Sep 2019 14:50:03 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8CCo3oG013358
 for <cocci@systeme.lip6.fr>; Thu, 12 Sep 2019 14:50:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,497,1559512800"; d="scan'208";a="401431823"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 14:50:03 +0200
Date: Thu, 12 Sep 2019 14:50:04 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: =?ISO-8859-15?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20190912123435.ztwsymd7m4s4n6hq@gintonic.linbit>
Message-ID: <alpine.DEB.2.21.1909121447550.2876@hadrien>
References: <20190912111304.2fu3lcqmtgbnolpx@gintonic.linbit>
 <alpine.DEB.2.21.1909121330300.2876@hadrien>
 <20190912123435.ztwsymd7m4s4n6hq@gintonic.linbit>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1980229386-1568292511=:2876"
Content-ID: <alpine.DEB.2.21.1909121448330.2876@hadrien>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 12 Sep 2019 14:50:06 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 12 Sep 2019 14:50:03 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1980229386-1568292511=:2876
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1909121448331.2876@hadrien>



On Thu, 12 Sep 2019, Christoph Böhmwalder wrote:

> On Thu, Sep 12, 2019 at 01:31:52PM +0200, Julia Lawall wrote:
> >
> > Sorry, it's not clear to me what you want to do.  Do you want to verify
> > that there is a const before renaming the parameter?  Could you do
> >
> > const unsigned
> > -a
> > +b
> >
> > ?
> >
> > julia
>
> I'll try and outline what I'm actually trying to do.
>
> Here's what I have:
>
> int drbd_submit_peer_request(struct drbd_device *device,
> 			     struct drbd_peer_request *peer_req,
> 			     const unsigned op, const unsigned op_flags,
> 			     const int fault_type)
> {
> // ...
> }
>
> This is what I want:
>
> int drbd_submit_peer_request(struct drbd_device *device,
> 			     struct drbd_peer_request *peer_req,
> 			     const unsigned rw,
> 			     const int fault_type)
> {
> // ...
> }
>
> And this is my cocci patch:
>
> @@
> identifier op, op_flags;
> struct bio *b;
> @@
> drbd_submit_peer_request(...
> -    , const unsigned op, const unsigned op_flags
> +    , const unsigned rw
>  ,...)
> {
> ...
> }
>
> This gives an error:
>
> minus: parse error:
>   File "drbd/drbd-kernel-compat/cocci/req_write__yes_present.cocci", line 35, column 22, charpos = 548
>   around = 'op',
>   whole content = -    , const unsigned op, const unsigned op_flags
>
>
> Doing it without the consts yields this:
>
>  int drbd_submit_peer_request(struct drbd_device *device,
> -                            struct drbd_peer_request *peer_req,
> -                            const unsigned op, const unsigned op_flags,
> +                            struct drbd_peer_request *peer_reqconst,
> +                            unsigned rw,
>                              const int fault_type)
>  {
>
> Notice the stray "const" behind "peer_req".
>
> So -- to answer your question -- my priority here is to get the code
> compiling; I don't actually care about any of the consts. Best case
> scenario would be to have it remove whether or not the consts are there
> and always add the new parameter with a const.

How about the following?

@@
identifier op, op_flags;
struct bio *b;
type T;
@@
T drbd_submit_peer_request(...,
-       unsigned op
+       unsigned rw
        ,
-       unsigned op_flags,
        ...)
{
...
}

It doesn't add a const on rw, though.  And it doesn't allow using the
const to figure out where to match.  I will have to look into why the
consts aren't being parsed properly.

julia
--8323329-1980229386-1568292511=:2876
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1980229386-1568292511=:2876--

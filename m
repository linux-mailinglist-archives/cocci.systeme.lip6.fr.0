Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9814025617A
	for <lists+cocci@lfdr.de>; Fri, 28 Aug 2020 21:43:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07SJhCgd023339;
	Fri, 28 Aug 2020 21:43:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 622A877BF;
	Fri, 28 Aug 2020 21:43:12 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 819033C97
 for <cocci@systeme.lip6.fr>; Thu, 27 Aug 2020 23:54:17 +0200 (CEST)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07RLsFfH018763
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA256 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Thu, 27 Aug 2020 23:54:16 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-58-iJVQv5u7OyCBBBM2t5KBVA-1; Thu, 27 Aug 2020 22:54:12 +0100
X-MC-Unique: iJVQv5u7OyCBBBM2t5KBVA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 27 Aug 2020 22:54:12 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 27 Aug 2020 22:54:12 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Joe Perches'" <joe@perches.com>, Alex Dewar <alex.dewar90@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        cocci <cocci@systeme.lip6.fr>
Thread-Topic: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Thread-Index: AQHWfJNPoPleWxCDKky1KLXQzyLa5alMfq2A
Date: Thu, 27 Aug 2020 21:54:12 +0000
Message-ID: <c256eba42a564c01a8e470320475d46f@AcuMS.aculab.com>
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
 <48f2dc90-7852-eaf1-55d7-2c85cf954688@rasmusvillemoes.dk>
 <20200827071537.GA168593@kroah.com>
 <20200827131819.7rcl2f5js3hkoqj2@lenovo-laptop>
 <def24e9e-018c-9712-0d07-d4cbc84f07d9@rasmusvillemoes.dk>
 <20200827144846.yauuttjaqtxaldxg@lenovo-laptop>
 <5d1dfb9b031130d4d20763ec621233a19d6a88a2.camel@perches.com>
In-Reply-To: <5d1dfb9b031130d4d20763ec621233a19d6a88a2.camel@perches.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 28 Aug 2020 21:43:16 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 27 Aug 2020 23:54:16 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Fri, 28 Aug 2020 21:43:10 +0200
Cc: Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "accessrunner-general@lists.sourceforge.net"
 <accessrunner-general@lists.sourceforge.net>
Subject: Re: [Cocci] [PATCH] usb: atm: don't use snprintf() for sysfs attrs
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

From: Joe Perches
> Sent: 27 August 2020 17:59
> To: Alex Dewar <alex.dewar90@gmail.com>; Rasmus Villemoes <linux@rasmusvillemoes.dk>; cocci
> <cocci@systeme.lip6.fr>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Kees Cook <keescook@chromium.org>; Gustavo A. R.
> Silva <gustavoars@kernel.org>; accessrunner-general@lists.sourceforge.net; linux-usb@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
> 
> On Thu, 2020-08-27 at 15:48 +0100, Alex Dewar wrote:
> > On Thu, Aug 27, 2020 at 03:41:06PM +0200, Rasmus Villemoes wrote:
> > > On 27/08/2020 15.18, Alex Dewar wrote:
> > > > On Thu, Aug 27, 2020 at 09:15:37AM +0200, Greg Kroah-Hartman wrote:
> > > > > On Thu, Aug 27, 2020 at 08:42:06AM +0200, Rasmus Villemoes wrote:
> > > > > > On 25/08/2020 00.23, Alex Dewar wrote:
> > > > > > > kernel/cpu.c: don't use snprintf() for sysfs attrs
> > > > > > >
> > > > > > > As per the documentation (Documentation/filesystems/sysfs.rst),
> > > > > > > snprintf() should not be used for formatting values returned by sysfs.
> > > > > > >
> > > > > >
> > > > > > Can we have a sysfs_sprintf() (could just be a macro that does sprintf)
> > > > > > to make it clear to the next reader that we know we're in a sysfs show
> > > > > > method? It would make auditing uses of sprintf() much easier.
> > > > >
> > > > > Code churn to keep code checkers quiet for pointless reasons?  What
> > > > > could go wrong with that...
> > >
> > > I did not (mean to) suggest replacing existing sprintf() calls in sysfs
> > > show methods. But when changes _are_ being made, such as when replacing
> > > snprintf() calls for whatever reasons, can we please not make it harder
> > > for people doing manual audits (those are "code checkers" as well, I
> > > suppose, but they do tend to only make noise when finding something).
> > >
> > > > > It should be pretty obvious to any reader that you are in a sysfs show
> > > > > method, as almost all of them are trivially tiny and obvious.
> > >
> > > git grep doesn't immediately show that, not even with a suitable -C
> > > argument, as you can't really know the potential callers unless you open
> > > the file and see that the function is only assigned as a .show method.
> > > And even that can be a pain because it's all hidden behind five levels
> > > of magic macros that build identifiers with ##.
> > >
> > > > Perhaps I should have mentioned this in the commit message, but the problem
> > > > is that snprintf() doesn't return the number of bytes written to the
> > > > destination buffer,
> > >
> > > I'm perfectly well aware of that, TYVM (you may want to 'git log
> > > --author Villemoes lib/vsprintf.c').
> > >
> > >  but the number of bytes that *would have been written if
> > > > they fitted*, which may be more than the bounds specified [1]. So "return
> > > > snprintf(...)" for sysfs attributes is an antipattern. If you need bounded
> > > > string ops, scnprintf() is the way to go. Using snprintf() can give a
> > > > false sense of security, because it isn't necessarily safe.
> > >
> > > Huh? This all seems utterly irrelevant WRT a change that replaces
> > > PAGE_SIZE by INT_MAX (because that's what sprintf() is going to pretend
> > > you passed). You get the same return value.
> > >
> > > But I'm not at all concerned about whether one passes the proper buffer
> > > size or not in sysfs show methods; with my embedded hat on, I'm all for
> > > saving a few bytes of .text here and there. The problem, as far as I'm
> > > concerned, is merely that adding sprintf() callers makes it harder to
> > > find the problematic sprintf() instances.
> > >
> >
> > Apologies, I think I might have expressed myself poorly, being a kernel noob
> > ;-). I know that this is a stylistic change rather than a functional
> > one -- I meant that I was hoping that it would be helpful to get rid of bad
> > uses of snprintf().
> >
> > I really like your idea of helper methods though :-). If in show()
> > methods we could have something like:
> > 	return sysfs_itoa(buf, i);
> > in place of:
> > 	return sprintf(buf, "%d\n", i);
> >
> > ... then we wouldn't be introducing any new calls to sprintf() as you
> > say, but we'd still be removing a call to snprintf() (which also may be
> > problematic). Plus we'd have type checking on the argument.
> >
> > For returning strings, we could have a bounded and unbounded variant of
> > the function. As it seems like only single values should be returned via
> > sysfs, if we did things this way then it would only be these
> > string-returning functions which could cause buffer overflow problems
> > and kernel devs could focus their attention accordingly...
> >
> > What do people think? I'm happy to have a crack, provided this is
> > actually a sensible thing to do! I'm looking for a newbie-level project
> > to get started with.

The problem with that idea is that is the code needs to
merge the output of two values or split an integer as nnn.nn
then it needs to do something different from the 'normal' code.

If the buffer is always PAGE_SIZE the why not embed it in
a structure.
The generated code will be the same, but it will be absolutely
explicit that the size is PAGE_SIZE if the code filling in the
buffer decides it needs to check.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
